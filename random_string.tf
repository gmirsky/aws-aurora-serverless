resource "random_string" "this" {
  length = 32
  # rds cluster password policy: Only printable ASCII characters besides '/', '@', '"', ' ' may be used.
  override_special = "!#$%&*()-_=+[]{}<>:?"
}