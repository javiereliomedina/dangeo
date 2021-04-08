#' Function for downloading geodata from kortforsyningen.dk
#'
#' @param ftp_folder Name of the ftp folder
#' @param zip_name   Name of the zip file we would like to download..
#' @param out_folder Name of the local folder where the data will be saved (by default it is set to the results of rappdirs::user_cache_dir()).
#' @param overwrite  Overwrite previous files (by default overwrite = FALSE)
#' @param userpwd    Username and Password (format = USERNAME:PASSWORD).
#'
#' @return Data from [https://download.kortforsyningen.dk/content/geodataprodukter](https://download.kortforsyningen.dk/content/geodataprodukter).
#'
#' @examples
#'
#' library(dangeo)
#'
#' # Set username, password, and local directory
#' dangeo_set_param()
#'
#' # Download data
#' dangeo_get_data(ftp_folder = "CORINE",
#'                 zip_name   = "DK_CORINE_SHP_UTM32-WGS84.zip")
#'
#' @export


dangeo_get_data <- function(ftp_folder = NULL,
                            zip_name = NULL,
                            out_folder = loc_dir,
                            userpwd = set_user,
                            overwrite = FALSE){

  ftp <- paste0("ftp://", set_user, "@ftp.kortforsyningen.dk")
  ftp_url <- paste(ftp, ftp_folder, zip_name, sep = "/")
  fs::file_create(out_folder)

  if(overwrite == TRUE) {

    # Download
    download.file(url = ftp_url,
                  destfile = paste(out_folder, zip_name, sep = "/"),
                  method = "curl")

    # Unzip file and remove it (.zip)
    unzip(zipfile = paste(out_folder, zip_name, sep = "/"),
          exdir   = gsub(".zip", "", paste(out_folder, zip_name, sep = "/")))
    fs::file_delete(paste(out_folder, zip_name, sep = "/"))

  } else if(gsub(".zip", "", zip_name) %in% list.files(out_folder)) {

    warning("The file already exist on the local directory and it has not been downloaded. Set overwrite = TRUE if you would like to overwrite it")

  } else {

    # Download
    download.file(url = ftp_url,
                  destfile = paste(out_folder, zip_name, sep = "/"),
                  method = "curl")

    # Unzip file and remove it (.zip)
    unzip(zipfile = paste(out_folder, zip_name, sep = "/"),
          exdir   = gsub(".zip", "", paste(out_folder, zip_name, sep = "/")))
    fs::file_delete(paste(out_folder, zip_name, sep = "/"))

  }
}

