# output "vm_ip_address_small" {
# value = { for i in sort(length(var.small)) : i => esxi_guest.small[i].ip_address}

# value = "[${esxi_guest.small[0].ip_address}]"
#}

