output "inventory" {
  value="${hcloud_server.nodes.*.ipv4_address}"
}