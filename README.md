
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
                zip_name   = "DK_CORINE_SHP_UTM32-WGS84.zip",
                out_folder = "DK_CORINE_SHP_UTM32-WGS84",
                file_name  = "CLC12_DK.shp")
#> Warning in dir.create(out_folder): 'DK_CORINE_SHP_UTM32-WGS84' already exists
#> Simple feature collection with 12128 features and 7 fields
#> geometry type:  POLYGON
#> dimension:      XY
#> bbox:           xmin: 416436.3 ymin: 6027439 xmax: 917794.9 ymax: 6427220
#> projected CRS:  WGS 84 / UTM zone 32N
#> # A tibble: 12,128 x 8
#>    OBJECTID ID    CODE_12 Area_Ha Remark SHAPE_Leng SHAPE_Area
#>       <int> <chr> <chr>     <dbl> <chr>       <dbl>      <dbl>
#>  1        1 DK_1  523      4.32e6 <NA>     7286136.    4.32e10
#>  2        2 DK_2  331      9.00e1 <NA>        7241.    9.00e 5
#>  3        3 DK_3  322      7.43e2 <NA>       18057.    7.43e 6
#>  4        4 DK_4  321      5.42e1 <NA>        4442.    5.42e 5
#>  5        5 DK_5  121      7.51e1 <NA>        5097.    7.51e 5
#>  6        6 DK_6  142      3.62e1 <NA>        2826.    3.62e 5
#>  7        7 DK_7  142      6.82e1 <NA>        4195.    6.82e 5
#>  8        8 DK_8  112      5.30e2 <NA>       16054.    5.30e 6
#>  9        9 DK_9  321      4.36e1 <NA>        4389.    4.36e 5
#> 10       10 DK_10 321      3.54e2 <NA>       20274.    3.54e 6
#> # ... with 12,118 more rows, and 1 more variable: geometry <POLYGON [m]>
```
