resource "google_project_iam_member" "dnsadmin" {
  project = "spry-sensor-262821" 
  role    = "roles/dns.admin"
  member = "${var.members[count.index]}"
  count = "${length(var.members)}"
}


resource "google_project_iam_member" "KubernetesAdmin" {
  project = "spry-sensor-262821" 
  role    = "roles/container.admin"
  member = "${var.members[count.index]}"
  count = "${length(var.members)}"
}

resource "google_project_iam_member" "storageadmin" {
  project = "spry-sensor-262821" 
  role    = "roles/compute.storageAdmin"
  member = "${var.members[count.index]}"
  count = "${length(var.members)}"
}


resource "google_project_iam_member" "owner" {
  project = "spry-sensor-262821" 
  role    = "roles/compute.admin"
  member = "${var.members[count.index]}"
  count = "${length(var.members)}"
}



