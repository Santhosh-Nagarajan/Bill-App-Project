terraform {
  required_version = ">= 0.14"

  required_providers {
    # Cloud Run support was added on 3.3.0
    google = ">= 3.3"
  }
}


##########################################

resource "google_project_service" "run_api" {
  service = "run.googleapis.com"

  disable_on_destroy = true
}

#############################################

# Create the Cloud Run service
resource "google_cloud_run_service" "run_service" {
  name     = var.cloud-run-service-name
  location = var.region

  template {
    spec {
      containers {
        ports {
          container_port = var.port
        }

        image = var.image-name

        env {
          name  = var.env-name
          value = var.env-value
        }
        env {
          name  = "GIT_TOKEN"
          value = "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"
        }
        env {
          name  = "GIT_USERNAME"
          value = "Santhosh-Nagarajan"
        }
        env {
          name  = "REPO_CLONE_PATH"
          value = "/apt/output/"
        }
        env {
          name  = "GIT_PYTHON_REFRESH"
          value = "quiet"
        }

      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  # Waits for the Cloud Run API to be enabled
  depends_on = [google_project_service.run_api]
}

##################################################################

resource "google_cloud_run_service_iam_member" "run_all_users" {
  service  = google_cloud_run_service.run_service.name
  location = google_cloud_run_service.run_service.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}