# Customized Vagrantfile Configuration for Three VMs

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"

  # Configuration for Frontend Server
  config.vm.define "frontend" do |frontend|
    frontend.vm.hostname = "frontend-server"
    frontend.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
    frontend.vm.network "private_network", ip: "192.168.56.21"
    frontend.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]
    frontend.vm.provision "shell", path: "setup-frontend.sh"
  end

  # Configuration for Backend Server
  config.vm.define "backend" do |backend|
    backend.vm.hostname = "backend-server"
    backend.vm.network "private_network", ip: "192.168.56.22"
    backend.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]
    backend.vm.provision "shell", path: "setup-backend.sh"
  end

  # Configuration for Media Server
  config.vm.define "media" do |media|
    media.vm.hostname = "media-server"
    media.vm.network "private_network", ip: "192.168.56.23"
    media.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]
    media.vm.provision "shell", path: "setup-media.sh"
  end

end