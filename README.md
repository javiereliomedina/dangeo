
# dangeo

## Overview

Package to access to the Map Supply Download via the kortforsyningen
FTP. You would need to create an account on
[kortforsyningen](https://www.kortforsyningen.dk/indhold/min-side-0).

## Instalation

## Installation

``` r
if (!require("remotes")) install.packages("remotes")
remotes::install_github("javiereliomedina/dangeo")
```

## Usage

``` r
  
library(dangeo) 
 
```

First we would need to set our Username (kortforsyningen\_id = “XXX”)
and Password (kortforsyningen\_pwd = “XXX”) on .Renviron.

``` r
# usethis::edit_r_environ()  # Open .Renviron file, and save the username and password
set_user <- paste(Sys.getenv("kortforsyningen_id"), Sys.getenv("kortforsyningen_pwd"), sep = ":" )
```

Then we can download the shapefiles
(e.g. *DK\_CORINE\_SHP\_UTM32-WGS84*).

``` r
dangeo_get_data(ftp_folder = "CORINE",
    file_name  = "DK_CORINE_SHP_UTM32-WGS84.zip",
    out_folder = "CORINE")
#> Warning in dir.create(out_folder): 'CORINE' already exists
#> [1] TRUE
```
