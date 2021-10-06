
######################################################################


#Create a router and attach to external network
resource "openstack_networking_router_v2" "router_1" {
  name                = "R1"
  admin_state_up      = true
  external_network_id = var.external_ip
}


### Network 1 ###
#Create network
resource "openstack_networking_network_v2" "network_1" {
  name           = "network_1"
  admin_state_up = "true"
}

#Create subnet for this network
resource "openstack_networking_subnet_v2" "subnet_1" {
  name       = "subnet_1"
  network_id = openstack_networking_network_v2.network_1.id
  cidr       = "192.168.1.0/24"
  ip_version = 4
}

#Attach router interface to network
resource "openstack_networking_router_interface_v2" "router_interface_1" {
  router_id = openstack_networking_router_v2.router_1.id
  subnet_id = openstack_networking_subnet_v2.subnet_1.id

}

######################################################################

### VLAN 110 ###
#Create network
resource "openstack_networking_network_v2" "vlan_110" {
  name           = "vlan_110"
  description    = "This VLAN is for the servers"
  admin_state_up = "true"
}

#Create subnet for this network
resource "openstack_networking_subnet_v2" "subnet_110" {
  name       = "subnet_110"
  network_id = openstack_networking_network_v2.vlan_110.id
  cidr       = "192.168.110.0/24"
  ip_version = 4
}

#Attach router interface to network
resource "openstack_networking_router_interface_v2" "router_interface_110" {
  router_id = openstack_networking_router_v2.router_1.id
  subnet_id = openstack_networking_subnet_v2.subnet_110.id

}

######################################################################

### VLAN 30 ###
#Create network
resource "openstack_networking_network_v2" "vlan_30" {
  name           = "vlan_30"
  description    = "This VLAN is for the cameras"
  admin_state_up = "true"
}

#Create subnet for this network
resource "openstack_networking_subnet_v2" "subnet_30" {
  name       = "subnet_30"
  network_id = openstack_networking_network_v2.vlan_30.id
  cidr       = "192.168.30.0/24"
  ip_version = 4
}

#Attach router interface to network
resource "openstack_networking_router_interface_v2" "router_interface_30" {
  router_id = openstack_networking_router_v2.router_1.id
  subnet_id = openstack_networking_subnet_v2.subnet_30.id

}

######################################################################

### VLAN 150 ###
#Create network
resource "openstack_networking_network_v2" "vlan_150" {
  name           = "vlan_150"
  description    = "This VLAN is for the databases"
  admin_state_up = "true"
}

#Create subnet for this network
resource "openstack_networking_subnet_v2" "subnet_150" {
  name       = "subnet_150"
  network_id = openstack_networking_network_v2.vlan_150.id
  cidr       = "192.168.150.0/24"
  ip_version = 4
}

#Attach router interface to network
resource "openstack_networking_router_interface_v2" "router_interface_150" {
  router_id = openstack_networking_router_v2.router_1.id
  subnet_id = openstack_networking_subnet_v2.subnet_150.id

}

######################################################################

### VLAN 50 ###
#Create network
resource "openstack_networking_network_v2" "vlan_50" {
  name           = "vlan_50"
  description    = "This VLAN is for the DMZ"
  admin_state_up = "true"
}

#Create subnet for this network
resource "openstack_networking_subnet_v2" "subnet_50" {
  name       = "subnet_50"
  network_id = openstack_networking_network_v2.vlan_50.id
  cidr       = "192.168.50.0/24"
  ip_version = 4
}

#Attach router interface to network
resource "openstack_networking_router_interface_v2" "router_interface_50" {
  router_id = openstack_networking_router_v2.router_1.id
  subnet_id = openstack_networking_subnet_v2.subnet_50.id

}


######################################################################

### VLAN 20 ###
#Create network
resource "openstack_networking_network_v2" "vlan_20" {
  name           = "vlan_20"
  description    = "This VLAN is for the guests"
  admin_state_up = "true"
}

#Create subnet for this network
resource "openstack_networking_subnet_v2" "subnet_20" {
  name       = "subnet_20"
  network_id = openstack_networking_network_v2.vlan_20.id
  cidr       = "192.168.20.0/24"
  ip_version = 4
}

#Attach router interface to network
resource "openstack_networking_router_interface_v2" "router_interface_20" {
  router_id = openstack_networking_router_v2.router_1.id
  subnet_id = openstack_networking_subnet_v2.subnet_20.id

}

######################################################################

### VLAN 200 ###
#Create network
resource "openstack_networking_network_v2" "vlan_200" {
  name           = "vlan_200"
  description    = "This VLAN is for the SAN"
  admin_state_up = "true"
}

#Create subnet for this network
resource "openstack_networking_subnet_v2" "subnet_200" {
  name       = "subnet_200"
  network_id = openstack_networking_network_v2.vlan_200.id
  cidr       = "192.168.200.0/24"
  ip_version = 4
}

#Attach router interface to network
resource "openstack_networking_router_interface_v2" "router_interface_200" {
  router_id = openstack_networking_router_v2.router_1.id
  subnet_id = openstack_networking_subnet_v2.subnet_200.id

}


######################################################################

### VLAN 10 ###
#Create network
resource "openstack_networking_network_v2" "vlan_10" {
  name           = "vlan_10"
  description    = "This VLAN is for the employees"
  admin_state_up = "true"
}

#Create subnet for this network
resource "openstack_networking_subnet_v2" "subnet_10" {
  name       = "subnet_10"
  network_id = openstack_networking_network_v2.vlan_10.id
  cidr       = "192.168.10.0/24"
  ip_version = 4
}

#Attach router interface to network
resource "openstack_networking_router_interface_v2" "router_interface_10" {
  router_id = openstack_networking_router_v2.router_1.id
  subnet_id = openstack_networking_subnet_v2.subnet_10.id

}
