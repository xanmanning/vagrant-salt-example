Vagrant.configure("2") do |config|
    config.vm.define "master" do |master|
        master.vm.box = "ubuntu/trusty64"
        master.vm.synced_folder "salt/", "/srv/salt/"
        master.vm.hostname = "master.salt.local"
        master.vm.network "private_network", ip: "10.10.8.2"
        master.vm.network "forwarded_port", guest: 4505, host: 4505

        master.vm.provision :salt do |salt|
            salt.install_master = true
            salt.install_type = "stable"
            salt.master_config = "salt/master"
            salt.minion_config = "salt/minion"
            salt.masterless = true
        end
        master.vm.provision :shell, inline: "salt '*' state.highstate"
    end

    config.vm.define "app" do |app|
        app.vm.box = "ubuntu/trusty64"
        app.vm.synced_folder "salt/", "/srv/salt/"
        app.vm.hostname = "app.salt.local"
        app.vm.network "private_network", ip: "10.10.8.3"

        app.vm.provision :salt do |salt|
            salt.install_master = false
            salt.install_type = "stable"
            salt.minion_config = "salt/minion"
            salt.run_highstate = true
        end
    end

    config.vm.define "db" do |db|
        db.vm.box = "ubuntu/trusty64"
        db.vm.synced_folder "salt/", "/srv/salt/"
        db.vm.hostname = "db.salt.local"
        db.vm.network "private_network", ip: "10.10.8.4"

        db.vm.provision :salt do |salt|
            salt.install_master = false
            salt.install_type = "stable"
            salt.minion_config = "salt/minion"
            salt.run_highstate = true
        end
    end
end
