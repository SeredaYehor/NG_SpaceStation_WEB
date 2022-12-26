data "template_file" "setup_production" {
  template = "${file("modules/application/setup_production.sh.tpl")}"

  vars = {
    public_key = "${var.agent_public_key}"
  }
}
