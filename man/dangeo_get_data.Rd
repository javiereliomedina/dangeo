% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dangeo_get_data.R
\name{dangeo_get_data}
\alias{dangeo_get_data}
\title{Function for downloading geodata from kortforsyningen.dk}
\usage{
dangeo_get_data(
  ftp_folder = NULL,
  zip_name = NULL,
  out_folder = loc_dir,
  userpwd = set_user,
  overwrite = FALSE,
  unzip = TRUE
)
}
\arguments{
\item{ftp_folder}{Name of the ftp folder}

\item{zip_name}{Name of the zip file we would like to download..}

\item{out_folder}{Name of the local folder where the data will be saved (by default it is set to the results of rappdirs::user_cache_dir()).}

\item{userpwd}{Username and Password (format = USERNAME:PASSWORD).}

\item{overwrite}{Overwrite previous files (by default overwrite = FALSE)}

\item{unzip}{Logical parameter indication if the file should be unzipped (TRUE) or not (FALSE)}
}
\value{
Data from \url{https://download.kortforsyningen.dk/content/geodataprodukter}.
}
\description{
Function for downloading geodata from kortforsyningen.dk
}
\examples{

library(dangeo)

# Set username, password, and local directory
dangeo_set_param()

# Download data
dangeo_get_data(ftp_folder = "CORINE",
                zip_name   = "DK_CORINE_SHP_UTM32-WGS84.zip")

}
