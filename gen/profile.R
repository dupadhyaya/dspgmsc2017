# Profile Settings
#https://csgillespie.github.io/efficientR/set-up.html

path.expand("~")  # User Home
R.home()   # R Home 
getwd()  # Project Home Dir

#Priority : Current Project > User Home > R Home
# Creating .Rprofile 
file.edit("~/.Rprofile") # edit .Rprofile in HOME
file.edit(".Rprofile") # edit project specific .Rprofile

# R Home
site_path = R.home(component = "home")
site_path
fname = file.path(site_path, "etc", "Rprofile.site")
fname
#Rprofile.site will exist by default
#if you have a site-wide .Rprofile, which will run for all users on start-up
file.edit(file.path("E:/Program Files/R/R-3.4.1/etc/","Rprofile.site"))

Sys.getenv("R_LIBS_USER")
Sys.getenv()
help("environment variables")



