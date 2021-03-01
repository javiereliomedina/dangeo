
# dangeo

## Overview

Package to access to the Map Supply Download via the kortforsyningen
FTP. You would need to create an account on
[kortforsyningen](https://www.kortforsyningen.dk/indhold/min-side-0).

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
and Password (kortforsyningen\_pwd = “XXX”) on *.Renviron*.

``` r
# usethis::edit_r_environ()  # Open .Renviron file, and save the username and password
set_user <- paste(Sys.getenv("kortforsyningen_id"), Sys.getenv("kortforsyningen_pwd"), sep = ":" )
```

Then we can download a “.zip” file
(e.g. *DK\_CORINE\_SHP\_UTM32-WGS84.zip*) in our local directory by
calling the function *dangeo\_get\_data()*. By default the local
directory is defined as *out\_folder = rappdirs::user\_cache\_dir()* but
we can change it (*out\_folder = “./local/path”*). The file will not be
downloaded if it already exist in the folder, but we can overwrite it by
setting *overwrite = TRUE*.

``` r
dangeo_get_data(ftp_folder = "CORINE",
                zip_name   = "DK_CORINE_SHP_UTM32-WGS84.zip")
```
