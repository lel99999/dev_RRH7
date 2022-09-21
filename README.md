# dev_RRH7
Out of band R dev for RHEL7

#### Running RStudio
```
$ssh -Y <host> QMLSCENE_DEVICE=software rstudio
```

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
![https://github.com/lel99999/dev_RRH7/blob/master/RStudio_tidyverse-01.png](https://github.com/lel99999/dev_RRH7/blob/master/RStudio_tidyverse-01.png) <br/>

#### Updated Tidyverse from Source
`$sudo R -e "install.packages('tidyverse', dependencies=TRUE, type="source", repos="https://cloud.r-project.org")"` <br/>

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

#### Check for missing YUM packages that provide files
```
$sudo yum whatprovides '*/package_name.sty'
```

#### Address fix for missing multirow.sty
```
$sudo yum install texlive-multirow*
```

#### Update tidyverse packages/dependencies
```
>install.packages(c("broom", "dbplyr", "dplyr", "dtplyr", "forcats", "ggplot2", 
"googledrive", "googlesheets4", "haven", "hms", "httr", "jsonlite", 
"lubridate", "magrittr", "modelr", "pillar", "purrr", "readr", 
"reprex", "rlang", "rvest", "tibble", "tidyr", "xml2"))
```

#### Function to check for dependencies for specific packages
```
instPkgPlusDeps <- function(pkg, install = FALSE,
                            which = c("Depends", "Imports", "LinkingTo"),
                            inc.pkg = TRUE) {
  stopifnot(require("tools")) ## load tools
  ap <- available.packages() ## takes a minute on first use
  ## get dependencies for pkg recursively through all dependencies
  deps <- package_dependencies(pkg, db = ap, which = which, recursive = TRUE)
  ## the next line can generate warnings; I think these are harmless
  ## returns the Priority field. `NA` indicates not Base or Recommended
  pri <- sapply(deps[[1]], packageDescription, fields = "Priority")
  ## filter out Base & Recommended pkgs - we want the `NA` entries
  deps <- deps[[1]][is.na(pri)]
  ## install pkg too?
  if (inc.pkg) {
    deps = c(pkg, deps)
  }
  ## are we installing?
  if (install) {
    install.packages(deps)
  }
  deps ## return dependencies
}

```

Then just use funtion as follows in R/RStudio: <br/>
```
> instPkgPlusDeps("tidyverse")
```

#### Function and utility to check if package is current
```
library(tools)

# Helper: a "functional" interface depth-first-search
fdfs = function(get.children) {
  rec = function(root) {
    cs = get.children(root);
    out = c();
    for(c in cs) {
      l = rec(c);
      out = c(out, setdiff(l, out));
    }
    c(out, root);
  }
  rec
}

# Entries in the package "Priority" field which indicate the
# package can't be upgraded. Not sure why we would exclude
# recommended packages, since they can be upgraded...
#excl_prio = c("base","recommended")
excl_prio = c("base")

# Find the non-"base" dependencies of a package.
nonBaseDeps = function(packages,
  ap=available.packages(),
  ip=installed.packages(), recursive=T) {

  stopifnot(is.character(packages));
  all_deps = c();
  for(p in packages) {
    # Get package dependencies. Note we are ignoring version
    # information
    deps = package_dependencies(p, db = ap, recursive = recursive)[[1]];
    ipdeps = match(deps,ip[,"Package"])
    # We want dependencies which are either not installed, or not part
    # of Base (e.g. not installed with R)
    deps = deps[is.na(ipdeps) | !(ip[ipdeps,"Priority"] %in% excl_prio)];
    # Now check that these are in the "available.packages()" database
    apdeps = match(deps,ap[,"Package"])
    notfound = is.na(apdeps)
    if(any(notfound)) {
      notfound=deps[notfound]
      stop("Package ",p," has dependencies not in database: ",paste(notfound,collapse=" "));
    }
    all_deps = union(deps,all_deps);
  }
  all_deps
}

# Return a topologically-sorted list of dependencies for a given list
# of packages. The output vector contains the "packages" argument, and
# recursive dependencies, with each dependency occurring before any
# package depending on it.
packageOrderedDeps = function(packages, ap=available.packages()) {

  # get ordered dependencies
  odeps = sapply(packages,
    fdfs(function(p){nonBaseDeps(p,ap=ap,recursive=F)}))
  # "unique" preserves the order of its input
  odeps = unique(unlist(odeps));

  # sanity checks
  stopifnot(length(setdiff(packages,odeps))==0);
  seen = list();
  for(d in odeps) {
    ddeps = nonBaseDeps(d,ap=ap,recursive=F)
    stopifnot(all(ddeps %in% seen));
    seen = c(seen,d);
  }

  as.vector(odeps)
}

# Checks if a package is up-to-date. 
isPackageCurrent = function(p,
  ap=available.packages(),
  ip=installed.packages(),
  verbose=T) {

    if(verbose) msg = function(...) cat("## ",...)
    else msg = function(...) NULL;

    aprow = match(p, ap[,"Package"]);
    iprow = match(p, ip[,"Package"]);
    if(!is.na(iprow) && (ip[iprow,"Priority"] %in% excl_prio)) {
      msg("Package ",p," is a ",ip[iprow,"Priority"]," package\n");
      return(T);
    }
    if(is.na(aprow)) {
      stop("Couldn't find package ",p," among available packages");
    }
    if(is.na(iprow)) {
      msg("Package ",p," is not currently installed, installing\n");
      F;
    } else {
      iv = package_version(ip[iprow,"Version"]);
      av = package_version(ap[aprow,"Version"]);
      if(iv < av) {
        msg("Package ",p," is out of date (",
            as.character(iv),"<",as.character(av),")\n");
        F;
      } else {
        msg("Package ",p," is up to date (",
            as.character(iv),")\n");
        T;
      }
    }
}

# Like install.packages, but skips packages which are already
# up-to-date. Specify dry_run=T to just see what would be done.
installPackages =
    function(packages,
             ap=available.packages(), dry_run=F,
             want_deps=T) {

  stopifnot(is.character(packages));

  ap=tools:::.remove_stale_dups(ap)
  ip=installed.packages();
  ip=tools:::.remove_stale_dups(ip)

  if(want_deps) {
    packages = packageOrderedDeps(packages, ap);
  }

  for(p in packages) {
    curr = isPackageCurrent(p,ap,ip);
    if(!curr) {
      if(dry_run) {
        cat("Would have installed package ",p,"\n");
      } else {
        install.packages(p,dependencies=F);
      }
    }
  }
}

# Convenience function to make sure all the libraries we have loaded
# in the current R session are up-to-date (and to update them if they
# are not)
updateAttachedLibraries = function(dry_run=F) {
  s=search();
  s=s[grep("^package:",s)];
  s=gsub("^package:","",s)
  installPackages(s,dry_run=dry_run);
}
```
#### Test haven::read_dta() which is a library for R to read Stata files
```
>library(haven)
>url <- "http://www.principlesofeconometrics.com/stata/broiler.dta"
>
>data.df <- read_dta(url)
>head(data.df)
```
#### Install Tidyverse stable/development versions from CRAN/github
```
# Install from CRAN
>install.packages("tidyverse")

# Install development version from github
>devtools::install_github("tidyverse/tidyverse")
```

#### Google Chrome Update
To access: <br/>
`$ssh -Y <hostname> /usr/bin/google-chrome` <br/>

#### Notebook Package not installed for SCL Python3.6, R ODBC Package not included in large R Deployment

#### Update JAVA for rJAVA
```
$sudo yum install java-1.8.0-openjdk-devel
$sudo R CMD javareonf
```

#### Install rJAVA in R
```
>install.package("rJava")
```

#### Install RSQLServer DEV or STABLE through github or CRAN
```
# GITHUB
>install.packages('devtools')
>devtools::install_github('imanuelcostigan/RSQLServer')

# CRAN
>install.packages("RSQLServer")
```

#### Updated for tidycensus
- install/scl enable devtools-8
- configure/make/make install gdal223
- copy related libraries to /lib64
- Install sf package
- Install tidycensus package

```
$sudo cp /usr/local/lib/libkml* /lib64/
$sudo cp /usr/local/lib/liburiparser* /lib64/
$sudo cp /usr/local/lib/libminizip* /lib64/

$sudo R -e 'install.packages("sf",repo="https://CRAN.R-project.org")'
$sudo R -e 'install.packages("tidycensus",repo="https://CRAN.R-project.org")'
```
#### R Postgresql Code
```
>con1 <- dbConnect(RPostgres::Postgres(),dbname = '<dbname>', host = '<hostname>', port = '5432', user = '<username>', password = '*****')
> query1 <- dbSendQuery(con1,'SELECT * from <table>;')
> dbFetch(query1)

```

#### R ODBC Code
```
>con1 <- DBI::dbConnect(odbc::odbc(),dsn='<dsn_name>',uid='<uid>',pwd='*****')
>query1 <- dbSendQuery(con1,'SELECT * from db.<table>;')
>dbFetch(query1)
```
            
#### Stringi & Stringr Package Install Notes
Resource Links: <br/>
- [https://support.rstudio.com/hc/en-us/articles/360039462714-Installing-stringi-in-air-gapped-offline-environments](https://support.rstudio.com/hc/en-us/articles/360039462714-Installing-stringi-in-air-gapped-offline-environments) <br/>
- [https://stringi.gagolewski.com/install.html](https://stringi.gagolewski.com/install.html) <br/>
- [https://github.com/gagolews/stringi/issues/170]() <br/>

##### ICU >= 55 Notes for RHEL 7.x
- [https://icu.unicode.org/download](https://icu.unicode.org/download) <br/>
- [https://github.com/gagolews/stringi/issues/170](https://github.com/gagolews/stringi/issues/170) <br/>

#### RStudio XWindows Hangs Resolution and Notes
- rm/bkp .rstudio
- review .RData/.Rprofile/.Rhistory

#### R/RStudio Session "hadabend" Errors
- "hadabend" Errors caused by .rstudio restoring past sessions
  - Fix (for some situations)
  ```
  $mv ~/.rstudio ~./rstudio.bkp
  ## Restart RStudio
  ```
#### R Upgrade RHEL 7 (v3.5 to v3.6)
```
$sudo yum list installed R-*
$sudo yum install R R-devel R-java R-java-devel R-core
```
![https://github.com/lel99999/dev_RRH7/blob/master/R-Pkgs-01.PNG](https://github.com/lel99999/dev_RRH7/blob/master/R-Pkgs-01.PNG) <br/>
            
#### R Version Management (Similar to Pyenv) to Run Different versions of R side-by-side
- Renv
  [https://github.com/viking/Renv](https://github.com/viking/Renv) <br/>

#### Override which versions of R is used setting environment variable RSTUDIO_WHICH_R
- Setting Environment Variable
  ```
  $export RSTUDIO_WHICH_R=/usr/local/bin/R
  ```
#### R Spark Integration
- Install sparklyr, dplyr, base64enc
  ```
  $sudo R -e "install.packages('bslib',repos='https://cran.rstudio.com')"
  $sudo R -e "install.packages('r2d3',repos='https://cran.rstudio.com')"
  $sudo R -e "install.packages('jsonlite',repos='https://cran.rstudio.com',dep=TRUE)"
  $sudo R -e "install.packages('arrow',repos='https://cran.rstudio.com')"
  $sudo R -e "install.packages('sparklyr',repos='https://cran.rstudio.com',dep=TRUE)"
  ```

#### Check and set .libPaths() in R
- check .libPaths() <br/>
  in R <br/>
  ```
  >.libPaths()
  [1] "/home/<user>/R/libraries
  [2] "/usr/lib64/R/library"
  >
  ```
- Set .libPaths() <br/>
  in .bash_profile add <br/>
  ```
  export R_LIBS_USER=/usr/lib64/R/library
  ```
            
#### Update rgdal installation notes on RHEL 7
- install gdal34, gdal34-devel, gdal34-libs, gdal34-python-tools, gdal34-python3
  `$sudo yum install gdal34 gdal34-devel gdal34-libs gdal34-python-tools gdal34-python3` <br/>
- install expat*, proj*
  `$sudo yum install expat* proj*` <br/>
- install rgdal
  `$sudo R -e "install.packages('rgdal', repos='https://cloud.r-project.org/')"` <br/>
- install devtools
  `$sudo R -e "install.packages('devtools', repos='https://cloud.r-project.org/')"` <br/>
  ![devtools dependencies](https://github.com/lel99999/dev_RRH7/blob/master/devtools_dependencies-01.PNG) <br/>
- install devtools additional dependencies via yum (libcurl-devel, libxml2-devel, openssl*-devel)

#### Updated Notes for RSQLServer, rJAVA
- install devtools, RSQLServer
  `$sudo R -e 'devtools::install_github("imanuelcostigan/RSQLServer")'` <br/>
- install rJava
  `$sudo R -e 'install.packages("rJava",repos="http://cloud.r-project.org")'` <br/>
- install tidyverse dependencies
  `$sudo R -e 'install.packages(c("broom", "dbplyr", "dplyr", "dtplyr", "forcats", "ggplot2", "googledrive", "googlesheets4", "haven", "hms", "httr", "jsonlite", "lubridate", "magrittr", "modelr", "pillar", "purrr", "readr", "reprex", "rlang", "rvest", "tibble", "tidyr", "xml2"), repos="http://cloud.r-project.org")'` <br/>
- install tidyverse
  `$sudo R -e 'install.packages("tidyverse",repos="http://cloud.r-project.org")'` <br/>
- tidyverse conflicts (which are deliberately ignored) - [ https://tidyverse.tidyverse.org/reference/tidyverse_conflicts.html](https://tidyverse.tidyverse.org/reference/tidyverse_conflicts.html) <br/>
  ![tidyverse conflicts](https://github.com/lel99999/dev_RRH7/blob/master/tidyverse_conflicts-01.PNG) <br/>

- install sf
  `$sudo yum install dnf` <br/>
  `$sudo dnf install gdal-devel proj-devel geos-devel sqlite-devel udunits2-devel` <br/>
  `$sudo R -e 'install.packages("sf",repos="http://cloud.r-project.org")'` <br/>

- XWindows Needed for Desktop
  `$sudo yum groupinstall "Server with GUI"` <br/>
  `$sudo yum groupinstall "Xfce"` <br/>
  `$sudo systemctl set-default graphical.target` <br/>
  
#### Scripting and Command-line frontend for R (littler)
- [http://dirk.eddelbuettel.com/code/littler.html](http://dirk.eddelbuettel.com/code/littler.html) <br/>
            
#### Install lwgeom
- [https://cran.r-project.org/web/packages/lwgeom/lwgeom.pdf](https://cran.r-project.org/web/packages/lwgeom/lwgeom.pdf) <br/>
  ```
  $sudo R -e 'install.packages("lwgeom",repos="https://cran.r-project.org")'
  ```

#### Build geos geos-devel from source
- [https://cmake.org/download/](https://cmake.org/download/) <br/>
- [https://libgeos.org/usage/download/](https://libgeos.org/usage/download/) <br/>

#### Use Doxygen for API Documentation
- [https://www.doxygen.nl/](https://www.doxygen.nl/) <br/>

#### Updating PROJ -> 6.2.x and SQLite -> 3.11.x for RHEL7
- [http://sqlite.org/2016/sqlite-autoconf-3110000.tar.gz](http://sqlite.org/2016/sqlite-autoconf-3110000.tar.gz) <br/>
  ```
  $./configure --prefix=/usr --disable-static        \
            CFLAGS="-g -O2 -DSQLITE_ENABLE_FTS3=1 \
            -DSQLITE_ENABLE_COLUMN_METADATA=1     \
            -DSQLITE_ENABLE_UNLOCK_NOTIFY=1       \
            -DSQLITE_SECURE_DELETE=1              \
            -DSQLITE_ENABLE_DBSTAT_VTAB=1" && make -j1


  $export SQLITE3_LIBS="-L/usr/lib -lsqlite3"
  ```

#### Update Rcpp
```
$sudo R -e 'install.packages("Rcpp", repos="https://RcppCore.github.io/drat")'
```
#### Install rstan on RHEL 7.9
- [https://mc-stan.org/](https://mc-stan.org/) <br/>
- [https://github.com/stan-dev/rstan](https://github.com/stan-dev/rstan) <br/>
- Using >= devtoolset-7
  ```
  $scl enable devtoolset-7 bash
  ```
- ERROR: C++14 standard requested but CXX14 is not defined <br/>
  - FIX:  Update R_Makevars add below
  ```
  ## C++ flags
  CXX=g++
  CXX11=g++
  CXX14=g++
  CXX17=g++
  ```
