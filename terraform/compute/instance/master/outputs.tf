output "public_ip" {
  value = "${oci_core_instance.master.0.public_ip}"
}
