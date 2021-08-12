# S3向けプレフィックスリストの取得
data "aws_prefix_list" "s3_pl" {
  name = "com.amazonaws.*.s3"
}

# EC2 AMIの検索
data "aws_ami" "app" {
  most_recent = true
  owners      = ["self", "amazon"]

  filter {
    name   = "name"
    values = ["tastylog-*-ami"]
  }
  # filter {
  #   name   = "name"
  #   values = ["amzn2-ami-hvm-2.0.*.2-x86_64-gp2"]
  # }
  # filter {
  #   name   = "root-device-type"
  #   values = ["ebs"]
  # }
  # filter {
  #   name   = "virtualization-type"
  #   values = ["hvm"]
  # }
}