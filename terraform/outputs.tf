output "master_public_ips" {
  value = "${module.master.public_ips}"
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

output "subnet_ad_1_id" {
  value = "${module.vcn.subnet_ad_1_id}"
}

output "subnet_ad_2_id" {
  value = "${module.vcn.subnet_ad_2_id}"
}

output "subnet_ad_3_id" {
  value = "${module.vcn.subnet_ad_3_id}"
}