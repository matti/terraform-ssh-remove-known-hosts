resource "null_resource" "start" {
  triggers = {
    depends_id = "${var.depends_id}"
  }
}

data "external" "ssh_keygen" {
  depends_on = ["null_resource.start"]

  program = ["ruby", "${path.module}/ssh-keygen.rb"]

  query = {
    hosts = "${jsonencode(var.hosts)}"
  }
}
