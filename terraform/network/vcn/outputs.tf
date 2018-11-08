output "subnet_ad_1_id" {
  value = "${oci_core_subnet.subnet_ad_1.id}"
}

output "subnet_ad_2_id" {
  value = "${oci_core_subnet.subnet_ad_2.id}"
}

output "subnet_ad_3_id" {
  value = "${oci_core_subnet.subnet_ad_3.id}"
}

output "loadbalancer_subnet_1_id" {
  value = "${oci_core_subnet.loadbalancer_subnet_1.id}"
}

output "loadbalancer_subnet_2_id" {
  value = "${oci_core_subnet.loadbalancer_subnet_2.id}"
}

output "vcn_id" {
  value = "${oci_core_virtual_network.vcn.id}"
}

output "compartment_id" {
  value = "${oci_core_virtual_network.vcn.compartment_id}"
}
