
resource "aws_lightsail_key_pair" "antinone_key" {
  name       = "public_id_aws_macbook"
  public_key = file(var.public_key_path)
}



resource "aws_lightsail_instance" "antinone" {
  name              = var.instance_name
  availability_zone = "${var.region}${var.availability_zone}" # Change to your desired availability zone
  blueprint_id      = var.os                                  # Change to desired OS blueprint
  bundle_id         = var.instance_type                       # Change to desired instance type
  key_pair_name     = aws_lightsail_key_pair.antinone_key.name
  user_data         = var.user_data_script
  tags = {
    name    = var.instance_name
    domain  = var.domain
    created = formatdate("YYYY-MM-DD", timestamp())
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install jq net-tools -y",
      "wget  https://raw.githubusercontent.com/vahiddsy/outline-server/master/src/server_manager/install_scripts/install_server.sh",
      "wget  https://antinone.xyz/file/scripts/dns-updater-v2-e.sh",
      "chmod +x install_server.sh",
      "chmod +x dns-updater-v2-e.sh",
      "yes | sudo ./install_server.sh --hostname ${var.domain} --api-port 12258 --keys-port 10901 —serve-name ${var.instance_name} ",
      "sudo usermod -G docker ${var.ssh_user}",
      "./dns-updater-v2-e.sh ${var.domain}",

    ]

    connection {
      type        = "ssh"
      host        = self.public_ip_address
      port        = 22
      user        = var.ssh_user
      private_key = file(var.ssh_key_path)
      agent       = true
    }
  }
}


resource "aws_lightsail_instance_public_ports" "antinone" {
  instance_name = aws_lightsail_instance.antinone.name

  port_info {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
    cidrs     = ["0.0.0.0/0"]
  }
  port_info {
    protocol  = "tcp"
    from_port = 12258
    to_port   = 12258
    cidrs     = ["0.0.0.0/0"]
  }
  port_info {
    protocol  = "udp"
    from_port = 10901
    to_port   = 10901
    cidrs     = ["0.0.0.0/0"]
  }
  port_info {
    protocol  = "tcp"
    from_port = 10901
    to_port   = 10901
    cidrs     = ["0.0.0.0/0"]
  }
}

