
# ROXYGEN Documentation
#' Unzip function for zipped PsN output
#' @description Many large filews like XML outpout and covariance matrices are zipped by (qPharmetra's tweaked version of) PsN. To enable the parsing function of the \code{nm.xxx} domain to operate well this function unzips these files.
#' @param run run rootname (e.g. \code{run1})
#' @param path directory where \code{run} resides
#' @param extension file extension of the file to unzip. Could be ".xml", or ".cov", or ".cor" or anything else that has been zipped
#' @param zip.extension extension of the zip program. Defaults to ".7z"
#' @param zip.program full path to the executable of the zip program (7zip or winzip). Defauls to "c:/progra~1/7-zip/7z"
#' @param filename file name (excluding path) of the filename to extract. Is automatically populated with qP workflow defaults
#' @param zip.filename filename of the zip file to extract. Is automatically populated with qP workflow defaults
#' @return The zipped file is extracted to disk in the same location. Nothing is returned to R.
#' @export
#' @examples 
#' file.exists( file.path(getOption("qpExampleDir"),"example1/example1.cov"))
#' nm.unzip(run="example1", extension=".cov", path = file.path(getOption("qpExampleDir"),"example1"))
#' file.exists( file.path(getOption("qpExampleDir"),"example1/example1.cov"))
#' file.remove( file.path(getOption("qpExampleDir"),"example1/example1.cov"))

nm.unzip = function(run
                    , path = file.path(getOption("nmDir"), run)
                    , zip.extension = ".7z"
                    , extension = ".xml"
                    , zip.program = "c:/progra~1/7-zip/7z"
                    , filename = paste(run, extension,sep="")
                    , zip.filename = paste(filename,zip.extension,sep = "")
                    , quiet = T
)
{
  currentwd = getwd()
  newwd = path
  if(!quiet) cat("path:", newwd, "\n")
  zip.call = paste(zip.program, "e", zip.filename)
  if(!quiet) cat("call:",zip.call,"\n")
  setwd(newwd)
  invisible(system(zip.call, show.output.on.console=ifelse(quiet,F,T)))
  setwd(currentwd)
}



