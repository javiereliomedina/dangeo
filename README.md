
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
#> $url
#> [1] "ftp://ftp.kortforsyningen.dk/CORINE/DK_CORINE_SHP_UTM32-WGS84.zip"
#> 
#> $status_code
#> [1] 226
#> 
#> $type
#> [1] NA
#> 
#> $headers
#>   [1] 32 32 30 20 50 72 6f 46 54 50 44 20 31 2e 33 2e 35 65 20 53 65 72 76 65 72
#>  [26] 20 28 4b 6f 72 74 66 6f 72 73 79 6e 69 6e 67 65 6e 20 46 54 50 29 20 5b 31
#>  [51] 37 32 2e 31 37 2e 35 2e 32 30 30 5d 0d 0a 33 33 31 20 50 61 73 73 77 6f 72
#>  [76] 64 20 72 65 71 75 69 72 65 64 20 66 6f 72 20 6a 61 76 69 65 72 65 6c 69 6f
#> [101] 6d 65 64 69 6e 61 0d 0a 32 33 30 20 55 73 65 72 20 6a 61 76 69 65 72 65 6c
#> [126] 69 6f 6d 65 64 69 6e 61 20 6c 6f 67 67 65 64 20 69 6e 0d 0a 32 35 37 20 22
#> [151] 2f 22 20 69 73 20 74 68 65 20 63 75 72 72 65 6e 74 20 64 69 72 65 63 74 6f
#> [176] 72 79 0d 0a 32 35 30 20 43 57 44 20 63 6f 6d 6d 61 6e 64 20 73 75 63 63 65
#> [201] 73 73 66 75 6c 0d 0a 32 31 33 20 32 30 31 34 31 32 31 38 30 39 34 33 35 36
#> [226] 0d 0a 32 32 39 20 45 6e 74 65 72 69 6e 67 20 45 78 74 65 6e 64 65 64 20 50
#> [251] 61 73 73 69 76 65 20 4d 6f 64 65 20 28 7c 7c 7c 36 30 39 31 39 7c 29 0d 0a
#> [276] 32 30 30 20 54 79 70 65 20 73 65 74 20 74 6f 20 49 0d 0a 32 31 33 20 31 36
#> [301] 33 33 34 30 39 30 0d 0a 31 35 30 20 4f 70 65 6e 69 6e 67 20 42 49 4e 41 52
#> [326] 59 20 6d 6f 64 65 20 64 61 74 61 20 63 6f 6e 6e 65 63 74 69 6f 6e 20 66 6f
#> [351] 72 20 44 4b 5f 43 4f 52 49 4e 45 5f 53 48 50 5f 55 54 4d 33 32 2d 57 47 53
#> [376] 38 34 2e 7a 69 70 20 28 31 36 33 33 34 30 39 30 20 62 79 74 65 73 29 0d 0a
#> [401] 32 32 36 20 54 72 61 6e 73 66 65 72 20 63 6f 6d 70 6c 65 74 65 0d 0a
#> 
#> $modified
#> [1] "2014-12-18 10:43:56 CET"
#> 
#> $times
#>      redirect    namelookup       connect   pretransfer starttransfer 
#>      0.000000      0.006785      0.033125      0.552532      0.566207 
#>         total 
#>     12.992530 
#> 
#> $content
#> [1] "C:\\Users\\FU53VP\\OneDrive - Aalborg Universitet\\Dokumenter\\GitHub\\dangeo\\CORINE\\DK_CORINE_SHP_UTM32-WGS84.zip"
```
