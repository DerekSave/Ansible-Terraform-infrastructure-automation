terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# 1) Descarga la imagen de Ubuntu 22.04
resource "docker_image" "ubuntu" {
  name         = "ubuntu:22.04"
  keep_locally = false
}

# 2) Crea un contenedor que se quede durmiendo (simula tu "micro")
resource "docker_container" "terraform-micro" {
  name    = "terraform-micro"
  image   = docker_image.ubuntu.name     # ← referencia al name de la imagen
  command = [
    "sh", 
    "-c", 
    "apt-get update && apt-get install -y python3 sudo && ln -s /usr/bin/python3 /usr/bin/python && sleep 3600"
  ]
  ports {
    internal = 80
    external = 8080
  }
}



# 3) Outputs útiles
output "container_id" {
  description = "ID del contenedor Docker creado"
  value       = docker_container.terraform-micro.id
}

output "container_name" {
  description = "Nombre del contenedor Docker"
  value       = docker_container.terraform-micro.name
}