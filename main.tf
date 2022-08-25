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
  disk_store = var.disk_store
  resource_pool_name = var.resource_pool_name
  memsize            = "${var.specs.small-mem}"
  numvcpus           = "${var.specs.small-cpu}"
  power              = "on"
  clone_from_vm = var.clone_from_vm
  guest_startup_timeout  = var.guest_startup_timeout
  guest_shutdown_timeout = var.guest_shutdown_timeout

  network_interfaces {
    virtual_network = var.virtual_network
  }
}

resource "esxi_guest" "medium" {
  count = "${length(var.medium)}"
  guest_name  = "${var.medium[count.index]}"  
  disk_store = var.disk_store
  resource_pool_name = var.resource_pool_name
  memsize            = "${var.specs.medium-mem}"
  numvcpus           = "${var.specs.medium-cpu}"
  power              = "on"
  clone_from_vm = var.clone_from_vm
  guest_startup_timeout  = var.guest_startup_timeout
  guest_shutdown_timeout = var.guest_shutdown_timeout

  network_interfaces {
    virtual_network = var.virtual_network
  }
}
