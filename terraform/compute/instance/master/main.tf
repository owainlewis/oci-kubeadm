resource "oci_core_instance" "master" {
  count               = "${var.count}"
  availability_domain = "${var.availability_domain}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "k8s-${var.display_name_prefix}-${count.index}"
  hostname_label      = "k8s-${var.display_name_prefix}-${count.index}"
  source_details {
      source_id = "${lookup(data.oci_core_images.image.images[0], "id")}"
      source_type = "image"
  }
  shape               = "${var.shape}"
  subnet_id           = "${var.subnet_id}"

  extended_metadata {
    roles               = "masters"
    ssh_authorized_keys = "${var.ssh_public_key}"
    tags      = "group:master"
  }

  freeform_tags = "${map("master", "true")}"
}
