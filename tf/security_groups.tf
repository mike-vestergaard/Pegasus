
### Security Groups ###
#Create security group for ssh
resource "openstack_compute_secgroup_v2" "ssh" {
  name        = "ssh"
  description = "a security group"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}
