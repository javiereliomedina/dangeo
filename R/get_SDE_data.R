#' Function for downloading geodata from kortforsyningen.dk
#'
#' @param ftp_folder Name of the ftp folder
#' @param file_name  Name of the file we would like to download
#' @param out_folder Name of the local folder where the data will be saved
#' @param SDE_user   Username and Password (format = USERNAME:PASSWORD)
#'
#' @return Data from [https://download.kortforsyningen.dk/content/geodataprodukter](https://download.kortforsyningen.dk/content/geodataprodukter)
#'
#' @examples
#'
#' # Set Username and Passwordm in .Renviron (usethis::edit_r_environ())
#'   id <- Sys.getenv("kortforsyningen_id")
#'   password <- Sys.getenv("kortforsyningen_pwd")
#'   SDE_user <- paste(id, password, sep = ":" )
#'
#' # Get data
#'   get_SDE_data(ftp_folder = "CORINE",
#'     file_name  = "DK_CORINE_SHP_UTM32-WGS84.zip",
#'     out_folder = "data/CORINE")
#'
#' @export

get_SDE_data <- function(ftp_folder = ftp_folder,
                         file_name = file_name,
                         out_folder = out_folder,
                         userpwd = SDE_user){
  ftp <- "ftp://ftp.kortforsyningen.dk"
  ftp_url <- paste(ftp, ftp_folder, "", sep = "/")
  dir.create(out_folder)
  dl_h <- curl::new_handle()
  curl::handle_setopt(dl_h, userpwd = userpwd, ftp_use_epsv = TRUE)
  curl::curl_fetch_disk(url = paste0(ftp_url, file_name),
                        path = paste(out_folder, file_name, sep = "/"),
                        handle = dl_h)

}



