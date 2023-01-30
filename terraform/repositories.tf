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
    "callisto-localdev" : {
    },
    "callisto-ui-nginx" : {
      "checks" : local.checks.drone
    },
    "callisto-timecard-restapi" : {
      "checks" : local.checks.drone
    },
    "callisto-jparest" : {
      "checks" : local.checks.drone
    },
    "callisto-ui" : {
      "checks" : local.checks.drone
    },
    "callisto-accruals-restapi" : {
      "checks" : local.checks.drone
    },
    "callisto-auth-keycloak" : {
      "checks" : [
        "terraform-validate (development)",
        "terraform-validate (test)", 
        "terraform-validate (production)"
      ]
    },
    "callisto-devops" : {
    }
  }
  repository_configs = {
    for k, v in local.repositories : k => {
      checks = try(v.checks, [])
    }
  }

}
