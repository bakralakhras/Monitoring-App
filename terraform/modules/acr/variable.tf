variable "resource_group_name"{
    type = string
}

variable "resource_group_location"{
    type = string
} 

variable "name"{
    type = string
    default = "az001"
}

variable "sku"{
    type=string
    default="Basic"
}