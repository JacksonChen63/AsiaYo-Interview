locals {

  ## AWS ADDONS
  aws_addons = {
    enable_aws_load_balancer_controller = try(var.addons.enable_aws_load_balancer_controller, false)
  }

}
