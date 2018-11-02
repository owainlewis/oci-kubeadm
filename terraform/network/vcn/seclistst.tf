resource "oci_core_security_list" "node" {
  count          = "1"
  compartment_id = "${var.compartment_ocid}"
  display_name   = "k8s-node"
  vcn_id         = "${oci_core_virtual_network.vcn.id}"

  egress_security_rules = [
    {
      protocol    = "all"
      destination = "0.0.0.0/0"
    },
  ]

  ingress_security_rules = [
    {
      protocol = "1"
      source   = "0.0.0.0/0"

      icmp_options {
	      "type" = 3
        "code" = 4
      }
    },

    {
      protocol = "6"
      source   = "0.0.0.0/0"

      tcp_options {
	      "min" = 6443
	      "max" = 6443
      }
    },

    {
      protocol = "all"
      source   = "${var.vcn_cidr}"
    },

    {
      protocol = "6"
      source   = "0.0.0.0/0"

      tcp_options {
	      "min" = 22
	      "max" = 22
      }
    },

    # node port range
    {
      protocol = "6"
      source   = "0.0.0.0/0"

      tcp_options {
	      "min" = 30000
	      "max" = 32767
      }
    },
  ]
}
