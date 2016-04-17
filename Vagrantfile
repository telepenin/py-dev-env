# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/wily64"
  config.vm.network "private_network", type: "dhcp"

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  config.vm.define "buildout" do |buildout|
    buildout.vm.hostname = "buildout"
    buildout.vm.network "forwarded_port", guest: 8000, host: 8001
    buildout.vm.provision :shell,
        privileged: false,
        path: "buildout_example/provision.sh"
  end

  config.vm.define "virtualenv" do |virtualenv|
    virtualenv.vm.hostname = "virtualenv"
    virtualenv.vm.network "forwarded_port", guest: 8000, host: 8002
    virtualenv.vm.provision :shell,
        path: "virtualenv_example/sudo_provision.sh"

    virtualenv.vm.provision :shell,
        privileged: false,
        path: "virtualenv_example/provision.sh"
  end

  config.vm.define "ansible" do |ansible|
    ansible.vm.hostname = "ansible"
    ansible.vm.network "forwarded_port", guest: 8000, host: 8003

    ansible.vm.provision "ansible" do |ans|
        ans.playbook = "ansible_example/vagrant.yml"
    end
  end

  config.vm.define "docker" do |docker|
    docker.vm.hostname = "docker"
    docker.vm.network "forwarded_port", guest: 8000, host: 8004

    docker.vm.provision "ansible" do |ansible|
        ansible.playbook = "docker_example/provision.yml"
    end
  end

end
