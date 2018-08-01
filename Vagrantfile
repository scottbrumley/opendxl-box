Vagrant.configure(2) do |config|
    config.vm.define "opendxl" do |opendxl|
            opendxl.vm.box = "ubuntu/xenial64"
            #opendxl.ssh.insert_key=false
            #opendxl.ssh.username = 'vagrant'
            #opendxl.ssh.password = 'vagrant'
            opendxl.vm.hostname = "opendxl"
            opendxl.vm.network "forwarded_port", guest: 8883, host: 8883
            opendxl.vm.network "forwarded_port", guest: 8443, host: 8443
            opendxl.vm.provision "shell", path: "scripts/bootstrap.sh"
            opendxl.vm.provider :virtualbox do |v|
                v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
                v.customize ["modifyvm", :id, "--memory", 512]
                v.customize ["modifyvm", :id, "--name", "opendxl"]
                ### On 64-bit Windows machine VT-Virtualization might need to be turned on in BIOS
                #v.customize ["modifyvm", :id, "--hwvirtex", "off"]
                #v.customize ["modifyvm", :id, "--vtxvpid", "off"]
                #v.customize ["modifyvm", :id, "--vtxux", "off"]
                #v.gui = true  ## For Debugging VM
            end
        end
end
