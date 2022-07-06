provider "esxi" {
  esxi_hostname = var.esxi_hostname
  esxi_hostport = var.esxi_hostport
  esxi_hostssl  = var.esxi_hostssl
  esxi_username = var.esxi_username
  esxi_password = var.esxi_password
}

resource "esxi_guest" "small" {
  count = "${length(var.small)}"
  guest_name  = "${var.small[count.index]}"  
  disk_store = "datastore1"
  resource_pool_name = "/"
  memsize            = "${var.specs.small-mem}"
  numvcpus           = "${var.specs.small-cpu}"
  power              = "on"
  clone_from_vm = "centos7"
  guest_startup_timeout  = 30
  guest_shutdown_timeout = 5

  network_interfaces {
    virtual_network = "VM Network"
  }
}

resource "esxi_guest" "medium" {
  count = "${length(var.medium)}"
  guest_name  = "${var.medium[count.index]}"  
  disk_store = "datastore1"
  resource_pool_name = "/"
  memsize            = "${var.specs-medium-mem}"
  numvcpus           = "${var.specs-medium-cpu"
  power              = "on"
  clone_from_vm = "centos7"
  guest_startup_timeout  = 30
  guest_shutdown_timeout = 5

  network_interfaces {
    virtual_network = "VM Network"
  }
}
