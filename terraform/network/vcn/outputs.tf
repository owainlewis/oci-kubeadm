output "subnet_ad1_id" {
  value = "${oci_core_subnet.subnet_ad_1.id}"
}

output "subnet_ad2_id" {
  value = "${oci_core_subnet.subnet_ad_2.id}"
}

output "subnet_ad3_id" {
  value = "${oci_core_subnet.subnet_ad_3.id}"
}

output "vcn_id" {
  value = "${oci_core_virtual_network.vcn.id}"
}

output "compartment_id" {
  value = "${oci_core_virtual_network.vcn.compartment_id}"
}