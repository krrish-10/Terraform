resource "azurerm_virtual_network""multiple"{
name = "vnet-${element(var.name,count.index)}"
resource_group_name = "${var.resource_group}"
location = "${var.location}"
address_space=["10.0.0.0/16"]
count="${length(var.name)}"
#count = "${var.no_of_vnets ==3 ?1  : 0}"
}