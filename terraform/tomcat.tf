# tomcat.tf

resource "google_compute_instance_template" "tomcat_template" {
  name          = "tomcat-template"
  machine_type  = "e2-medium"
  disk {
    source_image = "projects/${var.project_id}/global/images/tomcat-image"
    auto_delete  = true
  }
  network_interface {
    network = var.network
    subnetwork = var.subnetwork
    access_config {}
  }
  metadata_startup_script = <<-EOF
    #!/bin/bash
    docker run -d -p 8080:8080 ${var.tomcat_image}:latest
  EOF
}

resource "google_compute_instance_group_manager" "tomcat_group" {
  name               = "tomcat-group"
  base_instance_name = "tomcat"
  zone               = var.zone
  version {
    instance_template = google_compute_instance_template.tomcat_template.id
  }
  target_size        = 1
  update_policy {
    type                  = "PROACTIVE"
    minimal_action        = "REPLACE"
    max_surge_fixed       = 1
    max_unavailable_fixed = 0
  }
}
