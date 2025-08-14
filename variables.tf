variable "project_name" {
  type = string
}
variable "environment_name" {
  type = stirng
}
variable "sg_name" {
    type = string
  
}
variable "sg_discription" {
  type = string
}
variable "vpc_id" {
  type = string
}

variable "outbound_rules" {
  type= list
  default = [{
    from_portport = 0
    to_port =0
    protocol         = "-1" # all protocols
    cidr_blocks      = ["0.0.0.0/0"]
  }]
}

variable "ingress_rules" {
  type= list
  default = []
}

variable "common_tags" {  
type =  map

}
variable "sg_tags" {
  type = map
  default = {}
}
