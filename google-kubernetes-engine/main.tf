resource "google_container_cluster" "cluster" {
  name               = "cluster"
  location           = "us-west1-a"
  initial_node_count = 2

  node_config {
    preemptible  = true
    machine_type = "e2-standard-4"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  enable_autopilot    = false
  deletion_protection = false

  network    = "default"
  subnetwork = "default"

  description = "Klaster layanan terkelola GKE"
}

resource "google_compute_instance" "client" {
  name         = "client"
  zone         = "us-west1-a"
  machine_type = "e2-standard-4"

  boot_disk {
    initialize_params {
      image = "debian-12"
    }
  }

  network_interface {
    network = "default"

    access_config {}
  }

  metadata_startup_script = file("./client-start.sh")
}