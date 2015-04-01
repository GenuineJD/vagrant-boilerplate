VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # load up configuration file
  config_json = JSON.parse(File.read("vagrant/config.json"))

  config_json['scripts']['startup'].each do |script|
    config.vm.provision :shell, :path => script
  end

  # configure vm
  config.vm.box = config_json["vm"]["box"]
  config.vm.hostname = config_json["vm"]["hostname"]
  config.vm.network :private_network, ip: config_json["vm"]["ip"]

  if Vagrant.has_plugin?("vagrant-hostsupdater")
    config.hostsupdater.aliases = config_json["vm"]["hostaliases"]
    config.hostsupdater.remove_on_suspend = config_json["vm"]["hosts_remove_on_suspend"]
  else
    puts ""
    puts "Vagrant plugin 'vagrant-hostsupdater' is NOT installed.  Update yours hosts file manually."
    puts ""
  end

  # setup forwarded ports.
  config_json["vm"]["forwarded_ports"].each do |port|
    config.vm.network "forwarded_port", guest: port["guest"], host: port["host"], protocol: port["protocol"], auto_correct: port["auto_correct"]
  end

  # Customize provider.
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", config_json["vm"]["memory"]]

    # Synced Folders.
    config_json["vm"]["synced_folders"].each do |folder|
      case folder["type"]
      when "nfs"
        config.vm.synced_folder folder["host_path"], folder["guest_path"], type: "nfs"
        # This uses uid and gid of the user that started vagrant.
        config.nfs.map_uid = Process.uid
        config.nfs.map_gid = Process.gid
      else
        config.vm.synced_folder folder["host_path"], folder["guest_path"]
      end
    end
  end

  config_json["provisioners"].each do |provisioner|
    case provisioner["type"]
    when "puppet"
      config.vm.provision :puppet do |puppet|
        puppet.manifests_path = provisioner["manifests_path"]
        puppet.module_path = provisioner["module_path"]
        puppet.manifest_file = provisioner["manifest_file"]
        puppet.options = provisioner["options"]
      end
    end
    # TODO chef
  end

  config_json['scripts']['finish'].each do |script|
    config.vm.provision :shell, :path => script
  end

end
