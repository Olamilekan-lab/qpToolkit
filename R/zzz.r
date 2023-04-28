# Startup code

.onLoad <- function(libname, pkgname){
  #check and set default options

  if(is.null(getOption("nmDir"))) options(nmDir = file.path(getwd(),"NONMEM"))
  if(getOption("stringsAsFactors", FALSE)) {
    options(stringsAsFactors = FALSE)
  }
   if(Sys.getenv("UNZIP_CALL") == "" |Sys.getenv("ZIP_CALL") == "" ){
     if(!file.exists('c:/progra~1/7-zip/7z.exe')){
       warning('cannot find zip program c:/progra~1/7-zip/7z.exe; see ?nm.unzip')
     }
   }
   if(Sys.getenv("UNZIP_CALL") == ""){
      options(unzip.call = "c:/progra~1/7-zip/7z e %s.7z")
   } else{
      options(unzip.call = Sys.getenv("UNZIP_CALL"))
   }
   if(Sys.getenv("ZIP_CALL") == ""){
      options(zip.call = "c:/progra~1/7-zip/7z a %s.7z")
   } else{
      options(zip.call = Sys.getenv("ZIP_CALL"))
   }

}

.onAttach <- function(libname, pkgname){
  #packageStartupMessage(qP.welcome(Sys.getenv("USERNAME")))
  #packageStartupMessage(paste("package path = ", path.package("qpToolkit")))
  #packageStartupMessage(paste(R.installation.validation()$IQ.message))
  #packageStartupMessage("Installation Qualification disabled.  Unvalidated System.")
  #packageStartupMessage("setting stringsAsFactors to FALSE as qPharmetra default.")
  if(getOption("stringsAsFactors", FALSE)) {
     options(stringsAsFactors = FALSE)
  }
  if(is.null(getOption("qpExampleDir"))) options(qpExampleDir = file.path(path.package("qpToolkit"),"NONMEM"))
}
