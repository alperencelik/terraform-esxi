provider "esxi" {
  esxi_hostname = var.esxi_hostname
  esxi_hostport = var.esxi_hostport
  esxi_hostssl  = var.esxi_hostssl
  esxi_username = var.esxi_username
  esxi_password = var.esxi_password
}

# small ==> 2cpu 2ram || medium ==> 4cpu 4ram || large 8cpu 4ram || xlarge 8cpu 8ram

variable "small" {
  default = [
    "kubernetes-master",
	]
}

variable "medium" {
  default = [
    "Gitlab","kubernetes-worker-1","kubernetes-worker-2","kubernetes-worker-3",
	]
}

resource "esxi_guest" "small" {
  count = "${length(var.small)}"
  guest_name  = "${var.small[count.index]}"  
  disk_store = "datastore1"
  resource_pool_name = "/"
  memsize            = "2048"
  numvcpus           = "2"
  power              = "on"
  clone_from_vm = "centos7"
  guest_startup_timeout  = 5
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
  memsize            = "4096"
  numvcpus           = "4"
  power              = "on"
  clone_from_vm = "centos7"
  guest_startup_timeout  = 5
  guest_shutdown_timeout = 5

  network_interfaces {
    virtual_network = "VM Network"
  }
}
