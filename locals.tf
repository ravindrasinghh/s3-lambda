locals {
  global_name = "${var.environment}-${var.application}-${var.use_case}"
  tags = {
    Environment             = var.environment
    Application             = var.application
    Use_case                = var.use_case
    Can_be_deleted          = true
    Created_using_terraform = true
  }
}