
[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

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

First we would need to define the username and the password for
kortforsyningen, and the local directory where the files will be
downloaded (i.e. *dangeo\_set\_param()*). By default *dangeo* looks for
credentials on *.Renviron* (kortforsyningen\_id = “username” and
kortforsyningen\_pwd = “password”), and the local directory is defined
as *dangeo\_set\_param(loc\_dir = rappdirs::user\_cache\_dir())*,
although it can be changed (*dangeo\_set\_param(loc\_dir =
“./local/path”)*).

``` r
# usethis::edit_r_environ()  # Open .Renviron file, and save the username (kortforsyningen_id = "username") and password (kortforsyningen_pwd = "password")

dangeo_set_param()
```

Then we can download a “.zip” file
(e.g. *DK\_CORINE\_SHP\_UTM32-WGS84.zip*) in our local directory by
calling the function *dangeo\_get\_data()*. The file will not be
downloaded if it is already in the local directory, but we can overwrite
it by setting *overwrite = TRUE*.

``` r
dangeo_get_data(ftp_folder = "CORINE",
                zip_name   = "DK_CORINE_SHP_UTM32-WGS84.zip")
```
