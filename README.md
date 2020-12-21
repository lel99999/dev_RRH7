# dev_RRH7
Out of band R dev for RHEL7

#### Install ODBC 
```
>install.packages("DBI")
>install.packages("odbc") --- causes error, requires unixODBC-devel

$sudo yum install -y unixODBC-devel

>install.packages("odbc") --- compile issue with codecvt

Default version of gcc on RHEL 7 (4.8.5) is too old to compile - full support for <codecvt> was added in gcc5 -- install a precompiled odbc binary
from https://packagemanager.rstudio.com (built with newer gcc):
>install.packages("odbc",repos="https://packagemanager.rstudio.com/cran/__linux__/centos7/latest")
```
