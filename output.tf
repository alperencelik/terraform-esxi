output "vm_ip_address_small" {
  value = "[${esxi_guest.small.*.ip_address}]"
}

output "vm_ip_address_medium" {
  value = "[${esxi_guest.medium.*.ip_address}]"
}
