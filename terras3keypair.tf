provider "aws" {
    access_key = "AKIARDPJQIFC5CY4EZH2"
    secret_key = "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"
    region = "us-east-1"
}



resource "aws_instance" "web" {
    ami = "ami-038f1ca1bd58a5790"
    instance_type = "t2.micro"
    tags = {
        Name = "Java_App"
        Environment = "Dev"
    }
}

resource "aws_key_pair" "tayo" {
  key_name   = "terraform-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCxvFhDTX3zYgdHT3tmHWkUcVP/NGgE0N3Yoq2SFQv15eqHHx+HXNdj4S3d+3kKwwndP8q773O5BZS1RYxeRVf5EtfzG01ZHfP3OnhFH+nAsTfaS11RaGICkMkYW4YkkdyW6PAPmke9nrIz3wN133nPaN6ChJ6wv2KERJrhtsTi1CJOXOEfqrS2N2M4tHAFBbeKazndrj+dN3WkokzTrN8DffTLo5ro+dgiHa9ShKbzceRq11SkErjSoxuF1XIrm47YPpAgiGsPGGCunENBxx3DIM3HvOleVvjiE43unWzlaRnBI+7juMkxbgCZXYlxJK5LaOYZ8CwJclfIYhn0Iu9B9brFrTDxzEEBzFQ51FG/p7Z9SA1RXTuR/IytqYSeplYi+RCG7b+4G26aQrQS7PhZ+XKIBmD8gAqfArSs/wOxd3vlG22lqXgHqCN7138Fjhyz8/IwMASFdbNvFMyWnYNicPpITdMPipBS7IZUHwY+FTzbM+G8Ws4dEBxBuyNIs2M= tayo@Olaitans-MBP.lan"
}

resource "aws_s3_bucket" "tayobuc" {
  bucket = "s3-website-test4"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"

    routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": "documents/"
    }
}]
EOF
  }
}
