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
XML_files <- list.files(here::here('00_data/unziped/deskriptive'), 
                        recursive = TRUE, pattern = '*.xml',
                        full.names = TRUE)

taschenrechner <- '&lt;p&gt;&lt;a href=&quot;https://rdrr.io/snippets/embed/&quot; onclick=&quot;window.open(&apos;https://rdrr.io/snippets/embed/?code=&apos;,&apos;R Console&apos;,&apos; margin-top: 20px; top=200,left=100,width=480,height=640,menubar=no,toolbar=no,&apos;); return false;&quot; target=&quot;_blank&quot;&gt;&lt;img alt=&quot;R_ Logo&quot; pull-right=&quot;&quot; src=&quot;/econometrics/resource?resource=157444&quot; style=&quot;width: 40px; height: 50px; float: right; margin: 5px&quot; /&gt;&lt;/a&gt;&lt;/p&gt;&#xd;'

taschenrechner <- 'econometrics' #'src= /econometrics/resource?resource=157444'

taschenrechner <- "<p><a href="https://webrtaschenrechner.netlify.app/" onclick="window.open('https://webrtaschenrechner.netlify.app/','R Console','top=320, left=1525, width=400,height=600,menubar=no,toolbar=no,'); return false;" target="_blank"><img alt="R_ Logo" pull-right="" src="/econometrics/resource?resource=157444" style="width: 40px; height: 50px; float: right; margin: 5px" /></a></p>"


B <- xmlParse(XML_files[29]) 
# Change source 
B <- readLines(XML_files[29])



B_1 <- stringr::str_remove_all(B, taschenrechner)

writeLines(B_1, here::here('00_data/try.XML'))
write(B_1, here::here('00_data/try_1.XML'))
write(B, here::here('00_data/try_old.XML'))

