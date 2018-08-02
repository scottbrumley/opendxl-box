# OpenDXL-Box
> This project will build the current OpenDXL environment and run an OpenDXL broker on Docker.  
> It uses Vagrant and Virtualbox to build an automated development environment. 

## Prerequisites
- [Vagrant](https://www.vagrantup.com/downloads.html) at https://www.vagrantup.com/downloads.html
- [Virtualbox](https://www.virtualbox.org/wiki/Downloads) at https://www.virtualbox.org/wiki/Downloads
- [Git](https://git-scm.com/downloads)

## How To Run
1. **git clone https://github.com/scottbrumley/opendxl-box.git**
1. **cd opendxl-box**  (you can rename this directory to match your project)
1. **./scripts/vssh.sh**
1. **vagrant ssh**
1. **cd /vagrant**
1. **python -m dxlclient provisionconfig config localhost basic-event-cn**
1. **modify DxlClientConfig.create_dxl_config_from_file("/vagrant/dxlclient.config")**
1. Run your program

## Configure OpenDXL Certificates
**Syntax:**\
python -m dxlclient provisionconfig **\<certificate directory>** **\<OpenDXL Broker hostname>** **\<Certificate Common Name>**\
**i.e.** 
```python -m dxlclient provisionconfig config localhost basic-event-cn```

## Clean Up VM
- exit (to exit VM)
- ./scripts/vclean.sh (removes VM)

## OpenDXL Broker GUI
https://localhost:8443

### Login
- **Username:** admin
- **Password:** password

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
