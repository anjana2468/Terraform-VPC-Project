

resource "aws_instance" "webserver" {
  count = 2
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.websg.id]
  subnet_id = element([aws_subnet.sub1.id, aws_subnet.sub2.id], count.index)
  user_data = base64encode(file("${element(["userdata.sh", "userdata1.sh"], count.index)}"))
  
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "optional"
  }
}


resource "aws_s3_bucket" "example" {
  bucket = "anjanaterraformbucket"

}








