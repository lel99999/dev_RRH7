# dev_RRH7
Out of band R dev for RHEL7

#### Install ODBC 
```
>install.packages("DBI")
>install.packages("odbc") --- causes error, requires unixODBC-devel

$sudo yum install -y unixODBC-devel

>install.packages("odbc") --- compile issue with codecvt

Default version of gcc on RHEL 7 (4.8.5) is too old to compile - full support for <codecvt> was added in gcc5 -- install a precompiled odbc binary
from https://packagemanager.rstudio.com (built with newer gcc):

$sudo yum install devtoolset-8 -y
$scl enable devtoolset-8 bash
$R

>install.packages("odbc",repos="https://packagemanager.rstudio.com/cran/__linux__/centos7/latest")
```

#### Update R packages from list
`updpackages <- function(pkg){
            new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
            if (length(new.pkg)) 
                install.packages(new.pkg, dependencies = TRUE)
            sapply(pkg, require, character.only = TRUE)
}`<br/>

# invoke
`newpackages <- c("depth","fma","manipulate","rstudio","TukeyC","ccpr","ccpusr","cfpbdesign","fastmap","lifecycle","metro2","microbenchmark","rlang","seasonal","tictoc","x13binary","class","dplyr","filesstrings","ggplot2","ggseas","glmnet","gridExtra","lme4","magick","onehot","reshape2","zoo","devtools","mapproj","maps","shiny","digest","dummies","ellipsis","fastDummies","foreign","formattable","haven","insight","ISLR","kableExtra","nycflights13","pillar","popbio","questionr","rbenchmark","Rcpp","sjlabelled","stargazer","survey","tidyr","tidyverse","UScensus2010","vctrs","xtable","askpass","assertthat","BiocGenerics","BiocInstaller","callr","cbsa","ccdbr","clisymbols","CodeDepends","data.table","directlabels","dptemplate","dptemplate_old","drake","egg","evaluate","filelock","flextable","forcats","fs","fst_old","geofacet","ggjoy","gh","glue","here","highr","hms","httr","ini","IRanges","jsonlite","knitr","kpbkh","LaF","magrittr","markdown","mime","mintel","mondate","munsell","openssl","pkgbuild","pkgconfig","pkgload","processx","ps","purrr","R6","rcmdcheck","readr","remotes","ReporteRs","ReporteRsjars","rmarkdown","rocuments","rocx","rstudioapi","S4Vectors","scales","sessioninfo","stringi","stringr","sys","tibble","tidyselect","tinytex","txtq","usethis","xfun","xopen","yaml","bayestestR","effectsize","emmeans","ggeffects","glmmTMB","optiRum","parameters","performance","sjmisc","sjPlot","sjstats","TMB","anytime","backports","BH","blastula","blme","bridgesampling","brms","Brobdingnag","C50","captioner","cfpbdown","cfpbMail","checkmate","cli","clipr","coda","colorspace","commonmark","cowplot","ctcats","curl","datapasta","devEMF","dygraphs","ebbr","emailr","enc","fansi","feather","flexdashboard","foreach","gamlss","gamlss.data","gamlss.dist","generics","geometry","ggwaffle","gtable","iterators","lazyeval","linprog","lintr","lobstr","lpSolve","madlibR","mailDown","merTools","nleqslv","patchwork","prettydoc","proxyC","quanteda","r2d3","rakeR","RcppArmadillo","recipes","rethinking","reticulate","roxygen2md","rsvd","salesforcer","SnowballC","spacyr","spelling","stm","stopwords","stringdist","testthat","tidylo","treemap","tsibble","tufte","waffle","webshot","xml2","xmlparsedata","ATE","cdlTools","dint","expss","gepaf","ggfortify","humaniformat","isoband","osrm","qpdf","seg","tabulizer","tabulizerjars","timereg","usmap","alr3","fiftystater","log4r","mlogit","nnet","sas7bdat","statmod","TeachingDemos","tryCatchLog","ADGofTest","AMORE","AUC","AlgDesign","ArgumentCheck","BACCO","BB","BDgraph","BiasedUrn","BradleyTerry2","BsMD","CRM","CVST","Cairo","CircStats","ClustOfVar","Cubist","DBI","DBItest","DEoptim","DEoptimR","DMwR","DRR","DSL","DT","DendSer","DiagrammeR","DistributionUtils","DoE.base","EMCluster","Ecdat","Ecfun","Epi","EpiModel","FNN","FastImputation","Formula","FrF2","FrF2.catlg128","GA","GERGM","GGally","GeneralizedHyperbolic","GlobalOptions","Grid2Polygons","HadoopStreaming","HistogramTools","Hmisc","IRdisplay","ISOcodes","ISwR","LDAvis","Lahman","LearnBayes","MASS","MBA","MCMCpack","MCPMod","MGLM","MLmetrics","MNP","MatrixModels","ModelMetrics","NLP","NMF","NeuralNetTools","OAIHarvester","OceanView","OpenMPController","PCAmixdata","PKI","PerformanceAnalytics","Quandl","R.cache","R.methodsS3","R.oo","R.rsp","R.utils","R2HTML","RANN","RArcInfo","RColorBrewer","RCurl","RGtk2","RGtk2Extras","RJSONIO","RMySQL","RNifti","ROCR","RODBC","RPostgreSQL","RSAGA","RSNNS","RSQLite","RSiena","RSpectra","RSurvey","RUnit","RandomFields","RandomFieldsUtils","Rbitcoin","Rcgmin","Rcmdr","RcmdrMisc","RcmdrPlugin.temis","RcppEigen","RcppParallel","RcppProgress","RcppRoll","Rdpack","Rfacebook","RgoogleMaps","Rook","RoughSets","Rsolnp","Rtsne","Rttf2pt1","Runuran","Rvmmin","SQUAREM","SkewHyperbolic","SparseGrid","SparseM","StanHeaders","SuppDists","TH.data","TSP","TTR","TrialSize","UScensus2000cdp","UScensus2000tract","VGAM","VineCopula","XML","abind","acepack","acs","actuar","ada","additivityTests","ade4","adehabitatMA","agricolae","akima","amap","analogsea","animation","ape","aplpack","approximator","aqp","arm","arules","arulesViz","ash","aws.s3","aws.signature","babynames","base64","base64enc","base64url","bayesm","bayesplot","bbmle","bdsmatrix","benchden","bgmm","bibtex","biclust","biglm","binGroup","bindr","bindrcpp","binom","bit","bit64","bitops","blob","blogdown","bmp","boa","bookdown","brew","brglm","brnn","broom","btergm","ca","caTools","calibrator","car","carData","caret","cba","cellranger","chron","circlize","circular","classInt","clinfun","clue","clusterGeneration","clustertend","clv","cmprsk","coin","colorRamps","colourpicker","combinat","conf.design","config","contfrac","copula","corpcor","corpora","corrplot","covr","crayon","crosstalk","ctv","cubature","d3Network","d3heatmap","data.tree","dataCompareR","dbplyr","dbscan","ddalpha","deSolve","debugme","deepnet","degreenet","deldir","dendextend","denstrip","desc","descr","dfoptim","dichromat","diffobj","dimRed","diptest","dismo","distr","distrEx","distrom","doBy","doParallel","doRNG","dotCall64","downloader","dtplyr","dtw","dynamicTreeCut","e1071","earth","effects","elastic","elasticsearchr","ellipse","elliptic","emdist","emoa","emulator","epiR","epibasix","eply","ergm","ergm.count","estimability","etm","evd","evdbayes","evir","experiment","expint","expm","extraDistr","extrafont","extrafontdb","fAsianOptions","fBasics","fOptions","fakeR","fastICA","fastcluster","fastmatch","fda","fdrtool","fields","filehash","flashClust","flexclust","flexmix","flexsurv","fontBitstreamVera","fontLiberation","fontquiver","forecast","forecastHybrid","formatR","fossil","fpc","fracdiff","frbs","fslr","fts","fugeR","futile.logger","futile.options","future","future.apply","fuzzyjoin","gWidgets","gam","gamlr","gapminder","gbRd","gbm","gclus","gdata","gdistance","gdtools","geepack","genalg","gender","geoR","geoRglm","geoaxe","geomnet","geosphere","getPass","getopt","ggdendro","ggedit","ggforce","ggiraph","ggm","ggmap","ggnetwork","ggplot2movies","ggpubr","ggraph","ggrepel","ggridges","ggsci","ggsignif","ggthemes","ggvis","gistr","git2r","glasso","globals","gmailr","gmm","gmodels","gmp","gmt","goftest","googleVis","googledrive","googlesheets","gower","gpclib","gplots","greta","gridBase","gridSVG","grnn","gsl","gss","gstat","gsubfn","gtools","gutenbergr","hamlet","heatmaply","hexbin","highcharter","highlight","historydata","hmeasure","htmlTable","htmltools","htmlwidgets","httpuv","huge","hunspell","hypergeo","idbg","igraph","influenceR","inline","intergraph","intervals","inum","ipred","irlba","itertools","janeaustenr","janitor","jomo","jpeg","kdecopula","keras","kerasR","kernlab","klaR","koRpus","ks","labelVector","labeling","labelled","lambda.r","lars","lasso2","latentnet","later","latticeExtra","lava","lavaan","lazyWeave","lcopula","lda","leaflet","leafletR","leaps","lfe","libcoin","listenv","lmerTest","lmodel2","lmtest","locfit","loo","lsa","magic","manipulateWidget","mapdata","maptools","maptree","marmap","matrixStats","matrixcalc","maxLik","mclust","mcmc","mda","memisc","memoise","metricsgraphics","mgcv","mgm","mi","mice","miniUI","minqa","misc3d","miscTools","mitml","mlapi","mlbench","mmap","mnormt","modelr","modeltools","moments","monmlp","mschart","msm","mstate","muhaz","multcomp","multicool","mvbutils","mvnormtest","mvtboost","mvtnorm","nbpMatching","ncdf4","ndtv","network","networkD3","networkDynamic","networksis","neuralnet","neurobase","nloptr","nortest","numDeriv","numbers","oai","officer","openxlsx","optextras","optimx","orcutt","ore","oro.nifti","osmar","pROC","packrat","pacman","padr","pamr","pan","pander","partitions","party","partykit","pbapply","pbdBASE","pbdDMAT","pbdMPI","pbdSLAP","pbdZMQ","pbivnorm","pbkrtest","pcaPP","permute","pixiedust","pixmap","pkgKitten","pkgmaker","plm","plogr","plot3D","plot3Drgl","plotROC","plotly","plotmo","plotrix","pls","plumber","plyr","pmclust","pmml","png","pnn","poLCA","polspline","polyCub","polyclip","polycor","polynom","prabclus","pracma","praise","preprocomb","preprosim","preproviz","prettyunits","prodlim","profdpm","profileModel","profvis","progress","promises","proto","proxy","pryr","pscl","pspline","psych","pvclust","pwr","qap","qcc","qdapDictionaries","qdapRegex","qdapTools","qgraph","qrng","qrnn","quadprog","quantmod","quantreg","qvcalc","r2stl","random","randomForest","randomForestExplainer","randtoolbox","rappdirs","raster","rattle","rbokeh","rdetools","readbitmap","readstata13","readxl","registry","relevent","reliaR","relimp","rem","rematch","reports","repr","reprex","reshape","rex","rgenoud","rgeos","rgexf","rgl","rglwidget","rio","riverplot","rjson","rlecuyer","rlist","rms","rmutil","rngWELL","rngtools","robets","robustbase","roxygen2","rpart.plot","rprojroot","rsconnect","rstan","rstanarm","rstantools","rsvg","rticles","rugarch","rversions","rvest","rvg","rzmq","sampleSelection","sandwich","scatterplot3d","selectr","sem","seplyr","seriation","servr","setRNG","sfsmisc","shape","shapefiles","shinyAce","shinyBS","shinyWidgets","shinydashboard","shinyjs","shinystan","shinythemes","slackr","slam","sm","sna","snakecase","snow","snowfall","sourcetools","sp","spData","spacetime","spam","sparklyr","sparsepp","spatstat","spatstat.data","spatstat.utils","spc","spd","spdep","speedglm","spgrass6","splancs","spls","spsurvey","sqldf","stabledist","startupmsg","statnet","statnet.common","storr","strucchange","subselect","superpc","surveillance","survival","svUnit","svglite","sweep","systemfit","tables","tau","tcltk2","tensor","tensorflow","tergm","testit","texreg","textcat","textir","textmineR","textreuse","tfruns","tgp","threejs","tidygraph","tidytext","tiff","timeDate","timeSeries","timetk","tis","titanic","tkrplot","tnam","tokenizers","tree","triebeard","trimcluster","tripack","truncdist","truncnorm","truncreg","trust","tseries","tsna","turboEM","tweenr","twitteR","ucminf","units","urca","urltools","uroot","utf8","uuid","vcd","vdiffr","vegan","verification","vioplot","viridis","viridisLite","visNetwork","visdat","wbstats","webp","whisker","withr","wordcloud","wrapr","writexl","wskm","xaringan","xergm","xergm.common","xts","zeallot","zip","zipcode","leaflet.providers","ActuDistns","adehabitat","ANLP","bindrcpp_not_working","boilerpipeR","boot","cairoDevice","cluster","codetools","darch","debug","dendextendRcpp","elasticdsl","elmNN","fArma","fst","gdalUtils","gganimate","googlePolylines","GSIF","hive","inlmisc","IRkernel","its","KernSmooth","lattice","lubridate","mallet","Matrix","maxent","micromap","modeval","nlme","odbc","odfWeave","openNLP","openNLPdata","OpenStreetMap","plotGoogleMaps","plotKML","prob","qdap","rCharts","Rcpp_not_working","RDieHarder","RGA","rgdal","RGoogleAnalytics","rgp","rgpui","RH2","rJava","RJDBC","RKEA","RKEAjars","RMongo","RNeo4j","rpart","RSQLServer","RTextTools","RWeka","RWekajars","spatial","spatial.tools","spcosa","stream","streamgraph","SweaveListingUtils","tesseract","text2vec","tidyjson","tidyquant","tm","tm.plugin.alceste","tm.plugin.dc","tm.plugin.europresse","tm.plugin.factiva","tm.plugin.lexisnexis","tm.plugin.mail","tm.plugin.webmining","topicmodels","udunits2","venneuler","wle","wordnet","wordVectors","XLConnect","XLConnectJars","xlsx","xlsxjars","smbinning","minpack.lm","qpcR","rdrobust")`<br/>


`updpackages(newpackages)`<br/>

#### GDAL fix
#libkml Support<br/>
##---------This part is depending on prebuilt libraries. In the future we may replace this by compiling them from source.<br/>
`$wget http://s3.amazonaws.com/etc-data.koordinates.com/gdal-travisci/install-libkml-r864-64bit.tar.gz`<br/>
`$tar xzf install-libkml-r864-64bit.tar.gz`<br/>

#Copy these required files to  /usr/local<br/>
`$sudo cp -r install-libkml/include/* /usr/local/include`<br/>
`$sudo cp -r install-libkml/lib/* /usr/local/lib`<br/>
`$sudo ldconfig`<br/>


#download GDAL<br/>
wget http://download.osgeo.org/gdal/2.2.3/gdal-2.2.3.tar.gz<br/>

#Untar<br/>
`$tar xzf gdal-2.2.3.tar.gz`<br/>
`$cd gdal-2.2.3`<br/>

#Compile from source<br/>
`$./configure --with-libkml`<br/> 
`$make`<br/>
`$sudo make install`<br/>

#### Shared library error
Add /usr/local/lib to e.g. /etc/ld.so.conf.d/libgdal-x86_64.conf<br/>
Run ldconfig<br/>

#### R Command Line Install
`$sudo R -e 'install.packages("rgdal",repos="http://R-Forge.R-project.org")'`<br/>

Install RPMs (proj, proj-devel,proj-epsg,proj-nad) last 2 contain all of the support files<br/>
`$sudo R -e 'install.packages("PROJ",type="source",configure.args = paste0("--with-gdal-config=","/usr/local/bin/gdal-config"),repos="http://cran.rstudio.com",verbose=T)'`<br/>

`$sudo R -e 'install.packages("sf",type="source",configure.args = paste0("--with-gdal-config=","/usr/local/bin/gdal-config"),repos="http://cran.rstudio.com",verbose=T)'`<br/>

#### PostGIS on Postgresql 9.x
Install dependencies:<br/>
`$yum install geos-devel.x86_64`<br/>
`$yum proj-devel.x86_64`<br/>
`$yum proj-devel.x86_64`<br/>
`$yum install gdal-devel.x86_64`<br/>
`$yum install libxml2-devel.x86_64`<br/>
`$yum install json-c-devel.x86_64`<br/>

`$wget https://download.osgeo.org/postgis/source/postgis-2.4.4.tar.gz`<br/>
`$tar xvzf postgis-2.4.4.tar.gz`<br/>
`$cd postgis-2.4.4`<br/>
`$./configure --with-pgconfig=/usr/pgsql-9.5/bin/pg_config`<br/>
`$make`<br/>
`$sudo make install`<br/>

#### Tidyverse
`$sudo R -e "install.packages('tidyverse',contriburl='http://cran.rstudio.com/', dependencies = TRUE)"`<br/>
![https://github.com/lel99999/dev_RRH7/blob/master/RStudio_tidyverse-01.png](https://github.com/lel99999/dev_RRH7/blob/master/RStudio_tidyverse-01.png)

#### Add Openstreetmap
**The osmar package provides infrastructure to access OpenStreetMap data from different sources to work with the data in common R manner**<br/>

`$sudo R -e "install.packages('osmar',contriburl='http://cran.rstudio.com/', dependencies = TRUE)"`<br/>
`>library("osmar")`<br/>

#### RGDAL from Source
[https://github.com/OSGeo/gdal](https://github.com/OSGeo/gdal)

[https://trac.osgeo.org/gdal/wiki/DownloadSource](https://trac.osgeo.org/gdal/wiki/DownloadSource)

##### RGDAL Errors for RHEL 7
```
$sudo R -e 'install.packages("rgdal",repo="http://r-forge.r-project.org")'
or
In R:
>install.packages("rgdal",repo="http://http://r-forge.r-project.org")
```
Installation of package 'rgdal' had non-zero exit status <br/>
Fix: check /<path>/gdal23/lib/libgdal.so.20 -> points to correct lib <br/>

#### Updated RGDAL Version
[https://github.com/OSGeo/gdal/releases](https://github.com/OSGeo/gdal/releases) <br/>

ERROR: PROJ 6 symbols not found <br/>
[https://download.osgeo.org/proj/](https://download.osgeo.org/proj/) <br/>

ERROR: SQLITE3 library require => 3.11 <br/>
FIX: <br/>
```
$locate sqlite3
$export SQLITE3_LIBS=$SQLITE3_LIBS:/usr/sqlite330/lib
```

#### Updated Github Install
```
$sudo R -e 'devtools::install_github("CRAN/devtools")'
$sudo R -e 'devtools::install_github("CRAN/OpenStreetMap")'
```

#### Updated OpenStreetMap Fix
```
Make sure pre-requisite SCL repo is enabled
$sudo /usr/bin/subscription-manager repos --enable=rhel-server-rhscl-7-rpms 

Add SCL devtoolset-8 for latest gcc on RHEL 7
$sudo yum install -y devtoolset-8
$scl --list
$scl enable devtoolset-8 bash

rgdal prerequisites:
$sudo yum install -y gdal gdal-devel
$sudo yum install -y proj-devel
$sudo yum install -y proj-nad
$sudo yum install -y proj-epsg

$R
>install.packages("rgdal")

rJava prerequisites:
$sudo yum install -y gcc-c++ gcc-gfortran R R-core R-core-devel R-devel R-java R-java-devel java-1.8.0-openjdk-devel

Find libjvm.so (/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.275.b01-0.el7_9.x86_64/jre/lib/amd64/server/libjvm.so)
$export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.275.b01-0.el7_9.x86_64/jre/lib/amd64/server/
$R
>install.packages("rJava")

Once Dependencies are Met (rJava,rgdal)
>install.packages("OpenStreetMap")

Test Installation:
>library("OpenStreetMap")
```

#### Check Upgrade for R
```
$sudo yum check-upgrade R
```
