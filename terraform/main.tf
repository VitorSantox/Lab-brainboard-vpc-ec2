resource "azurerm_resource_group" "rg" {
  location = "brazilsoutheast"
  name     = "brainboard"
}

resource "azurerm_virtual_network" "vnet" {
  resource_group_name = azurerm_resource_group.rg.name
  location            = "brazilsoutheast"
  name                = "brainboard"
  tags                = merge(var.tags, {})

  address_space = [
    "10.0.0.0/16",
  ]
}

resource "azurerm_subnet" "subnet" {
  name                 = "brainboard"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name

  address_prefixes = [
    "10.0.1.0/24",
  ]
}

resource "azurerm_network_security_group" "nsg" {
  tags = merge(var.tags, {

  })
  resource_group_name = azurerm_resource_group.rg.name
  name                = "networksecgoup1"
  location            = "brazilsoutheast"

  security_rule {
    protocol                   = "TCP"
    destination_port_range     = "22"
    destination_address_prefix = "subnet"
    access                     = "Allow"

    destination_address_prefixes = [
      "",
    ]

    source_address_prefixes = [
      "*",
    ]
  }
}

resource "azurerm_virtual_machine" "vm-linux" {
  vm_size             = "B2s (Linux)"
  tags                = merge(var.tags, {})
  resource_group_name = azurerm_resource_group.rg.name
  name                = "vmlinux1"
  location            = "brazilsoutheast"

  network_interface_ids = [
    "",
  ]

  storage_os_disk {
    name          = "osdisk"
    create_option = "Attach"
  }
}

