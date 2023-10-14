variable "terratowns_endpoint" {
 type = string
}

variable "terratowns_access_token" {
 type = string
}

variable "teacherseat_user_uuid" {
 type = string
}

variable "e30m3" {
  type = object({
    public_path = string
    content_version = number
  })
}

variable "e36m3" {
  type = object({
    public_path = string
    content_version = number
  })
}

variable "applepie" {
  type = object({
    public_path = string
    content_version = number
  })
}