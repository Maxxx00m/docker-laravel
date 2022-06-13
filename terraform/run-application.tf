terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "application" {
  name = "maxxx00m/laravel-app:latest"
}

resource "docker_image" "database" {
  name = "maxxx00m/laravel-db:latest"
}

resource "docker_network" "application_network" {
  name = "my_network"
}

resource "docker_container" "application" {
  image = docker_image.application.latest
  name  = "app"

  ports {
    internal = 80
    external = 8888
  }

  networks_advanced {
    name = docker_network.application_network.name
  }

  depends_on = [docker_network.application_network, docker_container.db]
}

resource "docker_volume" "database_files" {
  name = "database_files"
}

resource "docker_container" "db" {
  image      = docker_image.database.latest
  name       = "db"

  networks_advanced {
    name = docker_network.application_network.name
  }

  env = ["MYSQL_ROOT_PASSWORD=q1w2e3r4t5", "MYSQL_DATABASE=test_site", "MYSQL_USER=test_site", "MYSQL_PASSWORD=password"]

  volumes {
    container_path = "/var/lib/mysql"
    volume_name = docker_volume.database_files.name
  }

  depends_on = [docker_network.application_network, docker_volume.database_files]
}

