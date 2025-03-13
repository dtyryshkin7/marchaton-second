
# Define the virtual machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "dtyryshkin-vm"
  location            = azurerm_resource_group.dtyryshkin-rg.location
  resource_group_name = azurerm_resource_group.dtyryshkin-rg.name
  network_interface_ids = [
    azurerm_network_interface.dtyryshkin-nic.id,
  ]
  size               = "Standard_DS1_v2"
  admin_username     = "username"
  admin_password     = "34FDA$#214f"  # For demonstration purposes only. Use secure methods for production.
  disable_password_authentication = "false"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "24.04-LTS"
    version   = "latest"
  }
}
