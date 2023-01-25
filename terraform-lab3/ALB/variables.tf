variable "vpc_id_for-tg" {
  type=string
}
variable "proxy1-id" {
  type=string
}
variable "proxy2-id" {
  type=string
}
variable "name-alb-pub" {
  type=string
}
variable "tg-name-pub" {
  type=string
}
variable "sec-gr-pub-alp" {
    type = list
}
variable "pub-subnets" {
     type = list
}
# ------------------------------------------------------
variable "name-alb-private" {
  type=string
}
variable "sec-gr-private-alp" {
  type = list
}
variable "private-subnets" {
  type = list
}
variable "tg-name-private" {
  type=string
}
variable "apache1-id" {
  type=string
}
variable "apache2-id" {
  type=string
}