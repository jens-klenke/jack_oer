#### loading packages
source('01_code/packages.R')

# desk files 
desk_files <- list.files(here::here('00_data/ziped/deskriptive'), recursive = TRUE, full.names = TRUE)
outDir <- here::here('00_data/unziped/deskriptive') 
for(i in 1:length(desk_files)){
  unzip(desk_files[i], exdir = outDir) 
}

# induktive files 
ind_files <- list.files(here::here('00_data/ziped/induktive'), recursive = TRUE, full.names = TRUE)
outDir_ind <- here::here('00_data/unziped/induktive') 
for(i in 1:length(ind_files)){
  unzip(ind_files[i], exdir = outDir_ind) 
}


# get all XML 
XML_files <- list.files(here::here('00_data/unziped'), 
                        recursive = TRUE, pattern = '*.xml',
                        full.names = TRUE)


# Change source 
