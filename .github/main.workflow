workflow "on pull request merge, delete the branch" {
  on = "pull_request"
  resolves = ["branch cleanup"]
}

action "branch cleanup" {
  uses = "jessfraz/branch-cleanup-action@master"
  secrets = ["GITHUB_TOKEN"]
}

workflow "New workflow" {
  on = "push"
  resolves = ["docker://ubuntu"]
}

action "docker://ubuntu" {
  uses = "docker://ubuntu"
  runs = "sudo apt-get update >/dev/null && sudo apt-get install -y zsh && make ci"
}
