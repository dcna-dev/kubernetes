resource "null_resource" "ansible" {
  provisioner "local-exec" {
    command = "sleep 15"
  }

  provisioner "local-exec" {
    command = "echo [master]  > hosts && echo ${google_compute_instance.default.0.network_interface.0.access_config.0.nat_ip}  >> hosts && echo >> hosts"
  }

  provisioner "local-exec" {
    command = "echo [nodes]  >> hosts && echo ${google_compute_instance.default.1.network_interface.0.access_config.0.nat_ip} >> hosts && echo ${google_compute_instance.default.2.network_interface.0.access_config.0.nat_ip} >> hosts"
  }

  provisioner "local-exec" {
    command = "echo  [all:vars] >> hosts && echo ansible_user=diegocananea >> hosts && echo ansible_ssh_common_args='-o StrictHostKeyChecking=no' >> hosts"
  }
 provisioner "local-exec" {
    command = "ansible-playbook -i hosts kubernetes.yml"
  }
}

