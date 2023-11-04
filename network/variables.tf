variable "auto_vpc_name" {
    type = string
}

variable "custom_vpc_name" {
    type = string
}

variable "create_auto_vpc_subnet" {
    type = bool
}

variable "create_custom_vpc_subnet" {
    type = bool
}

variable "subnet_name" {
    type = string
}

variable "region" {
    type = string
}

variable "ip_cidr_range" {
    type = string
}

variable "private_ip_google_access" {
    type = bool
}

variable "protocol" {
    type = string
}

variable "source_range" {
    type = string
}

variable "priority" {
    type = number
}