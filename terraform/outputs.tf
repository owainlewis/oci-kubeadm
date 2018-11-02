output "master_public_ip" {
  value = "${module.master.public_ip}"
}

output "node_ad_1_public_ips" {
  value = "${module.node_ad_1.public_ips}"
}

output "node_ad_2_public_ips" {
  value = "${module.node_ad_2.public_ips}"
}

output "node_ad_3_public_ips" {
  value = "${module.node_ad_3.public_ips}"
}

output "compartment_id" {
  value = "${module.vcn.compartment_id}"
}

output "vcn_id" {
  value = "${module.vcn.vcn_id}"
}
