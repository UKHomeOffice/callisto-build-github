locals {
  checks = {
    drone = [
      "continuous-integration/drone/pr",
      "continuous-integration/drone/push"
    ],
    code_analysis = [
      "SonarCloud"
    ]
  }

  repositories = {
    "callisto-test-1" : {
      "checks" : concat(local.checks.drone, local.checks.code_analysis)
    },
    "callisto-test-2" : {
      "checks" : concat(local.checks.drone, local.checks.code_analysis)
    },
    "callisto-build-github" : {
      "checks" : ["terraform-validate"]
    },
    "callisto-ingress-nginx" : {
      "checks" : local.checks.drone
    },
    "callisto-ui-nginx" : {
      "checks" : local.checks.drone
    },
    "callisto-timecard-restapi" : {
      "checks" : local.checks.drone
    }
  }
  repository_configs = {
    for k, v in local.repositories : k => {
      checks = try(v.checks, [])
    }
  }

}
