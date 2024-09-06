provider "kestra" {
  url = "http://localhost:8080"
}

# deploy flows to Kestra instance - https://kestra.io/docs/terraform/resources/flow
resource "kestra_flow" "flows" {
  for_each  = fileset(path.module, "flows/**/*.yml")
  flow_id   = yamldecode(templatefile(each.value, {}))["id"]
  namespace = yamldecode(templatefile(each.value, {}))["namespace"]
  content   = templatefile(each.value, {})
}
