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
resource "docker_container" "micro" {
  name    = "terraform-micro"
  image   = docker_image.ubuntu.name     # ← referencia al name de la imagen
  command = ["sleep", "3600"]
}


# 3) Outputs útiles
output "container_id" {
  description = "ID del contenedor Docker creado"
  value       = docker_container.micro.id
}

output "container_name" {
  description = "Nombre del contenedor Docker"
  value       = docker_container.micro.name
}
