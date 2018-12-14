resource "hcloud_server" "nodes" {
  count = 3
  name = "node${count.index}"
  ssh_keys = ["${hcloud_ssh_key.ssh_key.name}"]
  image = "centos-7"
  location = "nbg1" #nbg1, fsn1 or hel1
  /*
    hcurl https://api.hetzner.cloud/v1/images | grep name
    "name": "ubuntu-16.04",
    "name": "debian-9",
    "name": "centos-7",
    "name": "fedora-27",
    "name": "ubuntu-18.04",
    "name": "fedora-28",
  */
  server_type = "cx21"
  /*
    hcurl https://api.hetzner.cloud/v1/server_types | grep name
    "name": "cx11", ----> 1 vCPU / 2GB RAM / 20GB SSD / 20TB TRAFFIC
    "name": "cx11-ceph",
    "name": "cx21", ----> 2 vCPU / ...etc
    "name": "cx21-ceph",
    "name": "cx31",
    "name": "cx31-ceph",
    "name": "cx41",
    "name": "cx41-ceph",
    "name": "cx51",
    "name": "cx51-ceph",
    "name": "ccx11",
    "name": "ccx21",
    "name": "ccx31",
    "name": "ccx41",
    "name": "ccx51",
  */
}

resource "hcloud_ssh_key" "ssh_key" {
  name = "tf_key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}