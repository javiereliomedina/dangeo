#' Function for downloading geodata from kortforsyningen.dk
#'
#' @param ftp_folder Name of the ftp folder
#' @param zip_name   Name of the zip file we would like to download..
#' @param out_folder Name of the local folder where the data will be saved (by default it is set to the results of rappdirs::user_cache_dir()).
#' @param userpwd    Username and Password (format = USERNAME:PASSWORD).
#'
#' @return Data from [https://download.kortforsyningen.dk/content/geodataprodukter](https://download.kortforsyningen.dk/content/geodataprodukter).
#'
#' @examples
#'
#' # Set Username and Passwordm in .Renviron (usethis::edit_r_environ())
#'   id <- Sys.getenv("kortforsyningen_id")
#'   password <- Sys.getenv("kortforsyningen_pwd")
#'   set_user <- paste(id, password, sep = ":" )
#'
#' # Get data
#' dangeo_get_data(ftp_folder = "CORINE",
#'                 zip_name   = "DK_CORINE_SHP_UTM32-WGS84.zip")
#'
#' @export

dangeo_get_data <- function(ftp_folder = NULL,
                            zip_name = NULL,
                            out_folder = rappdirs::user_cache_dir(),
                            userpwd = set_user){
  if(gsub(".zip", "", zip_name) %in% list.files(out_folder)) {

    print("Warning: the files already exist on the local directory and thay have not been downloaded")

  } else {

    ftp <- "ftp://ftp.kortforsyningen.dk"
    ftp_url <- paste(ftp, ftp_folder, "", sep = "/")
    fs::file_create(out_folder)

    # Download
    dl_h <- curl::new_handle(CONNECTTIMEOUT = 80)
    curl::handle_setopt(dl_h, userpwd = set_user, ftp_use_epsv = TRUE)
    curl::curl_fetch_disk(url = paste0(ftp_url, zip_name),
                          path = paste(out_folder, zip_name, sep = "/"),
                          handle = dl_h)

    # Unzip file and remove it (.zip)
    unzip(zipfile = paste(out_folder, zip_name, sep = "/"),
          exdir   = gsub(".zip", "", paste(out_folder, zip_name, sep = "/")))
    fs::file_delete(paste(out_folder, zip_name, sep = "/"))

  }
}
