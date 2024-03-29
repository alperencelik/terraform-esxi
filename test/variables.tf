#  See https://www.terraform.io/intro/getting-started/variables.html for more details.

### ESXI Variables

variable "esxi_hostname" {
  default = "10.0.0.5"
}

variable "esxi_hostport" {
  default = "22"
}

variable "esxi_hostssl" {
  default = "443"
}

variable "esxi_username" {
  default = "root"
}

variable "esxi_password" { # Unspecified will prompt
  sensitive = true
}

### Guest VM Variables

variable "disk_store" {
  default = "datastore1"
}

variable "resource_pool_name" {
  default = "/"
}

variable "clone_from_vm" {
  default = "Fedora Server"
}

variable "guest_startup_timeout" {
  default = "90"
}

variable "guest_shutdown_timeout" {
  default = "5"
}

variable "virtual_network" {
  default = "VM Network"
}

# small ==> 2cpu 2ram || medium ==> 4cpu 4ram || large 8cpu 4ram || xlarge 8cpu 8ram

variable "small" {
  default = [
    "kubernetes-master-1"
        ]
}

variable "specs" {
  type = map
  default = {
  "small-mem" = "2048"
  "small-cpu" = "2"
  "medium-mem" = "8192"
  "medium-cpu" = "8"
  }
}

variable "medium" {
  default = [
    "kubernetes-worker-1","kubernetes-worker-2","kubernetes-worker-3"
       ]
}

