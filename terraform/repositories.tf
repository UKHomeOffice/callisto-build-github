locals {
  checks = {
    drone = [
      "continuous-integration/drone/pr",
      "continuous-integration/drone/push"
    ]
  }

  repositories = {
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
    "callisto-kafka-commons" : {
      "checks" : ["Build and analyze"]
    },
    "callisto-ui" : {
      "checks" : local.checks.drone
    },
    "callisto-accruals-restapi" : {
      "checks" : local.checks.drone
    },
    "callisto-person-restapi" : {
      "checks" : local.checks.drone
    },
    "callisto-accruals-person-consumer" : {
      "checks" : local.checks.drone
    },
    "callisto-balance-calculator" : {
      "checks" : local.checks.drone
    },
    "callisto-auth-keycloak" : {
      "checks" : [
        # Uncomment the following lines if keycloak realms are reinstated
        # "terraform-validate (development)",
        # "terraform-validate (test)",
        # "terraform-validate (production)"
      ]
    },
    "callisto-devops" : {
    },
    "callisto-service-template" : {
    },
    "callisto-helm-charts" : {
    }
  }
  repository_configs = {
    for k, v in local.repositories : k => {
      checks = try(v.checks, [])
    }
  }

}
