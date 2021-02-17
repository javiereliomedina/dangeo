
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
SDE_user <- paste(Sys.getenv("kortforsyningen_id"), Sys.getenv("kortforsyningen_pwd"), sep = ":" )
```

As an example, I have downladed a shapefile iwth the [Denmark’s
Administrative Geographical Division -
DAGI](https://download.kortforsyningen.dk/content/geodataprodukter) .

``` r
get_SDE_data(ftp_folder = "CORINE",
    file_name  = "DK_CORINE_SHP_UTM32-WGS84.zip",
    out_folder = "CORINE")
```
