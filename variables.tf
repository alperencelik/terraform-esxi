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

# small ==> 2cpu 2ram || medium ==> 4cpu 4ram || large 8cpu 4ram || xlarge 8cpu 8ram

variable "small" {
  default = [
    "kubernetes-master", "gitlab-runner-master", "nagios",
        ]
}

variable "specs" {
  type = map
  default = {
  "small-mem" = "2048"
  "small-cpu" = "2"
  "medium-mem" = "4096"
  "medium-cpu" = "4"
  }
}

variable "medium" {
  default = [
    "Gitlab","kubernetes-worker-1","kubernetes-worker-2","kubernetes-worker-3","gitlab-runner-worker","docker-host"
        ]
}

