#' Set parameters
#'
#' @param username Username
#' @param password Password
#' @param loc_dir  Name of the local directory where the data will be saved (by default it is set to the results of rappdirs::user_cache_dir()).
#'
#' @details Data are free to download but [https://download.kortforsyningen.dk](https://download.kortforsyningen.dk) requires a username and a password. We can set them inside our R script but it may be a good idea to save them on .Renviron for not including credentials in our code. Therefore, it is the default in dangeo, with username = kortforsyningen_id and password = kortforsyningen_pwd.
#'
#' For saving the username and the password on .Renviron you would need to run "usethis::edit_r_environ()" on your console and save them as kortforsyningen_id = "XXX" and kortforsyningen_pwd = "XXX". Finally, you would need to restart R.
#'
#' dangeo_set_param() should be run before downloading any data from kortforsyningen with dangeo_get_data().
#'
#' The local directory is defined as *loc_dir = rappdirs::user_cache_dir()* but you can change it (*loc_dir = "./local/path"*). A selected file will not be downloaded if it is already on the local directory (unless we specify we want to overwrite it). It is useful because some files are large (> 2GB) and they take some time to be downloaded. If you change the local directory I would therefore recommend you to use a folder that can be used in different projects.
#'
#' @export

dangeo_set_param <- function(username = Sys.getenv("kortforsyningen_id"),
                             password = Sys.getenv("kortforsyningen_pwd"),
                             loc_dir  = rappdirs::user_cache_dir()){

  set_user <- paste(username, password, sep = ":" )
  loc_dir  <- loc_dir

  assign("set_user", set_user, envir = .GlobalEnv)
  assign("loc_dir", loc_dir, envir = .GlobalEnv)
}
