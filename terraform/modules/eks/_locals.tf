locals {
  common_tags = merge(
    {
      Module = "eks"
    },
    var.tags
  )
}
