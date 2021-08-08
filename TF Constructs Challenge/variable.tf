variable "resource_group"{
 default = "user-nuqo"
  } 
 variable "location"{ 
 default = "East US"
  }  
  variable "name"{
   type = list(string)
   default = ["A","B","C"]
  }
   #variable "no_of_vnets"{
   #default= 3
#}
  