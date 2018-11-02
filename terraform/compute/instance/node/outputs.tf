output "public_ips" {
  value = "${oci_core_instance.node.*.public_ip}"
}
