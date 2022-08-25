# Install R
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran40/'
sudo apt update
sudo apt -y install r-base

sudo apt-get -y install libcurl4-openssl-dev
sudo apt-get -y install libssl-dev
sudo apt-get -y install libsasl2-dev
sudo apt-get -y install libsodium-dev
sudo apt-get -y install libxml2-dev
sudo apt-get -y install libharfbuzz-dev libfribidi-dev
sudo apt-get -y install libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev

# Install LaTeX
sudo apt-get -y install texlive-latex-base
sudo apt-get -y install texlive-latex-recommended texlive-pictures texlive-latex-extra

# Install pandoc
sudo apt-get -y install pandoc

# Install packages
# sudo apt-get -y install r-cran-xml
sudo su - -c "R -e \"install.packages(c('tidyverse','chron','devtools','digest','DT','flexdashboard','ggplot2','lattice','markdown','pander','psych','readxl','writexl','shiny','shinydashboard','stringr','shinyWidgets','shinyjs','shinyauthr'), repos='http://cran.rstudio.com/')\""
# sudo su - -c "R -e \"install.packages(c('devtools'), repos='http://cran.rstudio.com/')\""
# sudo su - -c "R -e \"remotes::install_github('colearendt/shinycookie')\""
sudo su - -c "R -e \"remotes::install_version('mongolite', version = '2.3.1')\""
sudo su - -c "R -e \"remotes::install_github('jbryer/likert')\""
sudo su - -c "R -e \"remotes::install_github('stenevang/sftp')\""

# Install R shiny. Visit this link to get the latest version:
# https://www.rstudio.com/products/shiny/download-server/

sudo apt-get install gdebi-core
wget https://download3.rstudio.org/ubuntu-18.04/x86_64/shiny-server-1.5.19.995-amd64.deb
sudo gdebi shiny-server-1.5.19.995-amd64.deb
sudo ufw allow 3838

sudo rm -R /srv/shiny-server/*
cd /srv/shiny-server/
git clone https://github.com/DAACS/DAACS-Dashboard .
sudo systemctl restart shiny-server


