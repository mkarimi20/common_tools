resource "google_project_iam_member" "project" {
  project = "spry-sensor-262821"
  role = "roles/owner"
  member  = "maksatabakirov73@gmail.com"
}
