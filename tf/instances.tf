### ADMIN SERVER ###
#Create a port on network for admin_sever
resource "openstack_networking_port_v2" "admin_port" {
  name           = "admin_port"
  network_id     = openstack_networking_network_v2.network_1.id
  admin_state_up = "true"

  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.subnet_1.id
    ip_address = "192.168.1.11"
  }
}

#connect port to instance admin_server
resource "openstack_compute_instance_v2" "admin_server" {
  name            = "admin_server"
  image_id        = "bbf26e02-ba0c-4086-8df3-d169687d7393" #Ubuntu 20
  key_pair        = "alextest"
  flavor_id       = "3f73fc93-ec61-4808-88df-2580d94c1a9b" #v1-standard-2
  security_groups = ["${openstack_compute_secgroup_v2.ssh.name}", var.default_security_group]
  network {
    port = openstack_networking_port_v2.admin_port.id
  }
}
#floating ip
resource "openstack_networking_floatingip_v2" "floatip_1" {
  pool = "elx-public1"
}

#attach to admin_server
resource "openstack_networking_floatingip_associate_v2" "fip_1" {
  floating_ip = openstack_networking_floatingip_v2.floatip_1.address
  port_id     = openstack_networking_port_v2.admin_port.id
}


######################################################################


### DATABASE ###
#Create a port on network for database
resource "openstack_networking_port_v2" "database_port" {
  name           = "database_port"
  network_id     = openstack_networking_network_v2.vlan_150.id
  admin_state_up = "true"

  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.subnet_150.id
    ip_address = "192.168.150.10"
  }
}

#create connect port to instance database
resource "openstack_compute_instance_v2" "database" {
  name            = "database"
  image_id        = "bbf26e02-ba0c-4086-8df3-d169687d7393" #Ubuntu 20
  key_pair        = "admin-server"
  flavor_id       = "3f73fc93-ec61-4808-88df-2580d94c1a9b" #v1-standard-2
  security_groups = [var.default_security_group]

  metadata = {
    sw_database_mysql_admin       = "root"
    sw_database_mysql_listen_port = "3606"
  }

  network {
    port = openstack_networking_port_v2.database_port.id
  }
}


######################################################################


### Server 1 ###
#Create a port on network for database
resource "openstack_networking_port_v2" "server_1_port" {
  name           = "server_1_port"
  network_id     = openstack_networking_network_v2.vlan_110.id
  admin_state_up = "true"

  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.subnet_110.id
    ip_address = "192.168.110.11"
  }
}

#create connect port to instance database
resource "openstack_compute_instance_v2" "server_1" {
  name            = "server_1"
  image_id        = "bbf26e02-ba0c-4086-8df3-d169687d7393" #Ubuntu 20
  key_pair        = "admin-server"
  flavor_id       = "3f73fc93-ec61-4808-88df-2580d94c1a9b" #v1-standard-2
  security_groups = [var.default_security_group]

  metadata = {
    sw_database_mysql_admin       = "root"
    sw_database_mysql_listen_port = "3606"
  }

  network {
    port = openstack_networking_port_v2.server_1_port.id
  }
}

######################################################################


### Server 2 ###
#Create a port on network for database
resource "openstack_networking_port_v2" "server_2_port" {
  name           = "server_2_port"
  network_id     = openstack_networking_network_v2.vlan_110.id
  admin_state_up = "true"

  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.subnet_110.id
    ip_address = "192.168.110.12"
  }
}

#create connect port to instance database
resource "openstack_compute_instance_v2" "server_2" {
  name            = "server_2"
  image_id        = "bbf26e02-ba0c-4086-8df3-d169687d7393" #Ubuntu 20
  key_pair        = "admin-server"
  flavor_id       = "3f73fc93-ec61-4808-88df-2580d94c1a9b" #v1-standard-2
  security_groups = [var.default_security_group]

  metadata = {
    sw_database_mysql_admin       = "root"
    sw_database_mysql_listen_port = "3606"
  }

  network {
    port = openstack_networking_port_v2.server_2_port.id
  }
}

