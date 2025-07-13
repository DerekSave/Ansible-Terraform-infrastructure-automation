# Automatización de Infraestructura con Ansible + Terraform

## Objetivo
Despliegue automático de un servidor web (Nginx) usando:
- Terraform para crear contenedor Docker
- Ansible para configuración del sistema

## Componentes Clave
- `main.tf`: Configuración de Docker (Ubuntu 22.04)
- `configure_server.yml`: Playbook de Ansible para:
  - Actualización del sistema
  - Instalación de Nginx
  - Creación de página HTML personalizada
  - Configuración de servicio
- `inventory.ini`: Inventario estático para conexión vía Docker

## Requisitos
1. Terraform >= 1.0
2. Ansible >= 2.14
3. Docker Desktop (con integración WSL2)
4. Python 3.x

## Uso
```bash
# Inicializar Terraform
terraform init

# Desplegar infraestructura
terraform apply -auto-approve

# Ejecutar Ansible
ansible-playbook -i inventory.ini configure_server.yml

# Acceder al servidor
http://localhost:8080
```
