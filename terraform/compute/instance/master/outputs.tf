output "public_ips" {
  value = "${oci_core_instance.master.*.public_ip}"
}
