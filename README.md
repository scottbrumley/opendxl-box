# opendxl-box

## How To Run
vagrant up

## How to Access
vagrant ssh

## OpenDXL Broker GUI
https://localhost:8443

## OpenDXL Broker Port
TCP 8883

## Example Vagrant File 
```
Vagrant.configure(2) do |config|
    config.vm.define "opendxl" do |opendxl|
            opendxl.vm.box = "sbrumley/opendxl"
            opendxl.vm.box_version = "2.0"
            opendxl.vm.network "forwarded_port", guest: 8883, host: 8883
            opendxl.vm.network "forwarded_port", guest: 8443, host: 8443
            opendxl.vm.provision "shell", path: "scripts/bootstrap.sh"
            opendxl.vm.provider :virtualbox do |v|
                v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
                v.customize ["modifyvm", :id, "--memory", 512]
                v.customize ["modifyvm", :id, "--name", "web"]
                ### On 64-bit Windows machine VT-Virtualization might need to be turned on in BIOS
                #v.customize ["modifyvm", :id, "--hwvirtex", "off"]
                #v.customize ["modifyvm", :id, "--vtxvpid", "off"]
                #v.customize ["modifyvm", :id, "--vtxux", "off"]
                #v.gui = true  ## For Debugging VM

            end
        end
end
```
