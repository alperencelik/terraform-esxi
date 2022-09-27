output "Small_typed_machines" {
  value = [for i in esxi_guest.small : "${i.ip_address} server_name=${i.guest_name}"]
}

output "medium_typed_machines" {
  value = [for i in esxi_guest.medium : "${i.ip_address} server_name=${i.guest_name}"]
}