resource "google_compute_instance" "default" {
  count = "${var.node_count}"
  name         = "cw-${count.index}"
  machine_type = "${var.vm_type}"
  zone         = "${var.zone}"

  tags = ["k8s"]

  boot_disk {
    initialize_params {
      image = "${var.vm_image}"
    }
  }

  // Local SSD disk
  scratch_disk {
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
  metadata {
   sshKeys = "${var.user}:${file("~/.ssh/id_rsa.pub")}"
    }
}

resource "google_compute_firewall" "default" {
  name    = "firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "30000-32767"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["k8s"]
}

