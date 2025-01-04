data "http" "terraform_runner_ip" {
  url = "https://api.ipify.org?format=json"
}
