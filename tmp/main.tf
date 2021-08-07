terraform {
  required_version = ">=0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">3.0"
    }
  }
}

provider "aws" {
  profile = "terraform"
  region  = "ap-northeast-1"
}

/* study "count"
resource "aws_iam_user" "user" {
  count = 2
  name  = "testuser-${count.index}"
}
*/

/* study "for_each"
resource "aws_vpc" "vpc" {
  cidr_block = "192.168.0.0/20"
}

resource "aws_subnet" "subnet" {
  for_each = {
    "192.168.1.0/24" = "ap-northeast-1a"
    "192.168.2.0/24" = "ap-northeast-1c"
    "192.168.3.0/24" = "ap-northeast-1d"
  }

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = each.key
  availability_zone = each.value
}
*/

/* study "for"
variable "obj" {
  type = object({
    name = string
    age  = number
  })
  default = {
    name = "tanaka"
    age  = 28
  }
}

variable "tuple" {
  type = tuple([
    string, number
  ])
  default = ["tanaka", 28]
}

variable "list" {
  type    = list(string)
  default = ["tanaka", "sato"]
}

variable "map" {
  type = map(string)
  default = {
    "High" = "m5.2xlarge"
    "Mid"  = "m5.large"
    "Low"  = "t2.micro"
  }
}

variable "set" {
  type = set(string)
  default = [
    "tanaka",
    "sato",
    "tanaka",
    "sato"
  ]
}
*/

/* 以下をterraform consoleで実行
[ for s in var.list : upper(s) ]
{ for s in var.list : s => upper(s) }
[ for k,v in var.map : upper(v) ]
{ for k,v in var.map : v => k }
*/

/* study 三項演算子
variable "message" {
  type = string
  default = ""
}
*/

/* 以下をterraform consoleで実行
var.message != "" ? var.message : "Good night"
*/