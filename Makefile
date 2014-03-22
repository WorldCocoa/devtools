

############################### Var setup. use Makefile.local to override #################
# For operators :=  =  ?=  !=  see http://stackoverflow.com/a/448939/420688


############################### Add in helper commands ######################

include include.DockerUtils.Makefile
include include.GitUtils.Makefile


############################### Add in commands from child Makefiles ######################

-include repos/docker-postgresql/Makefile
-include repos/docker-base/Makefile


