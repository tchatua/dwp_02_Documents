
```bash 
ll ../a01_vpc/
``` 
total 9
-rw-r--r-- 1 Tchatua 197609 2497 Mar 28 18:49 main.tf
-rw-r--r-- 1 Tchatua 197609    0 Mar 28 18:37 nat_gw.md
-rw-r--r-- 1 Tchatua 197609  295 Mar 28 18:51 output.tf
-rw-r--r-- 1 Tchatua 197609  506 Mar 28 18:50 variables.tf

```bash
touch main.tf output.tf variables.tf
``` 

$ ll ../../a01_modules/a01_vpc/
total 9
-rw-r--r-- 1 Tchatua 197609 2484 Mar 28 20:32 main.tf
-rw-r--r-- 1 Tchatua 197609    0 Mar 28 18:37 nat_gw.md
-rw-r--r-- 1 Tchatua 197609  295 Mar 28 18:51 output.tf
-rw-r--r-- 1 Tchatua 197609  506 Mar 28 18:50 variables.tf


a01_vpc_dev (a01_terraform)
$ terraform output
dwp_pub_sub_01_dev_id = "subnet-0330abace7db9bd3a"
dwp_pub_sub_02_dev_id = "subnet-0d5d06b7192940952"
dwp_vpc_dev_id = "vpc-04fca43d34d0a3546"
