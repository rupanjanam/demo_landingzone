bastion_hosts = {
  bastion_hub_re1 = {
    name               = "bastion-re1"
    region             = "singapore"
    resource_group_key = "gitops"
    vnet_key           = "vnet_gitops"
    subnet_key         = "AzureBastionSubnet"
    public_ip_key      = "bastion_host_re1"
  }
}

# Virtual machines
virtual_machines = {
  jumpbox1 = {
    resource_group_key = "gitops"
    provision_vm_agent = true

    os_type = "windows"

    # when not set the password is auto-generated and stored into the keyvault
    keyvault_key = "secrets"

    # Define the number of networking cards to attach the virtual machine
    networking_interfaces = {
      nic0 = {
        vnet_key                = "vnet_gitops"
        subnet_key              = "jumpbox"
        name                    = "0-jumpbox1"
        enable_ip_forwarding    = false
        internal_dns_name_label = "jumpbox1-nic0"

      }
    }

    virtual_machine_settings = {
      windows = {
        name           = "jumpbox1"
        size           = "Standard_D4s_v4"
        admin_username = "adminuser"

        # Value of the nic keys to attach the VM. The first one in the list is the default nic
        network_interface_keys = ["nic0"]

        os_disk = {
          name                 = "jumpbox1-os"
          caching              = "ReadWrite"
          create_option        = "FromImage"
          storage_account_type = "Standard_LRS"
          managed_disk_type    = "StandardSSD_LRS"
          disk_size_gb         = "128"
        }

        source_image_reference = {
          publisher = "MicrosoftWindowsDesktop"
          offer     = "Windows-10"
          sku       = "20h2-pro"
          version   = "latest"
        }

      }
    }

  }
}