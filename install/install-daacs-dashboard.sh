figlet -t -k -f /usr/share/figlet/small.flf "Installing R"
# Install R
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran40/'
sudo apt update
sudo apt -y install r-base

figlet -t -k -f /usr/share/figlet/small.flf "Installing dependencies"
sudo apt-get -y install libcurl4-openssl-dev
sudo apt-get -y install libssl-dev
sudo apt-get -y install libsasl2-dev
sudo apt-get -y install libsodium-dev
sudo apt-get -y install libxml2-dev
sudo apt-get -y install libharfbuzz-dev libfribidi-dev
sudo apt-get -y install libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev

figlet -t -k -f /usr/share/figlet/small.flf "Installing LaTeX"
# Install LaTeX
sudo apt-get -y install texlive-latex-base
sudo apt-get -y install texlive-latex-recommended texlive-pictures texlive-latex-extra

figlet -t -k -f /usr/share/figlet/small.flf "Installing pandoc"
# Install pandoc
sudo apt-get -y install pandoc

figlet -t -k -f /usr/share/figlet/small.flf "Installing R packages"
# Install packages
# sudo apt-get -y install r-cran-xml
sudo su - -c "R -e \"install.packages(c('tidyverse','chron','devtools','digest','DT','flexdashboard','ggplot2','lattice','markdown','pander','psych','readxl','writexl','shiny','shinydashboard','stringr','shinyWidgets','shinyjs','shinyauthr'), repos='http://cran.rstudio.com/')\""
# sudo su - -c "R -e \"install.packages(c('devtools'), repos='http://cran.rstudio.com/')\""
# sudo su - -c "R -e \"remotes::install_github('colearendt/shinycookie')\""
sudo su - -c "R -e \"remotes::install_version('mongolite', version = '2.3.1')\""
sudo su - -c "R -e \"remotes::install_github('jbryer/likert')\""
sudo su - -c "R -e \"remotes::install_github('stenevang/sftp')\""

figlet -t -k -f /usr/share/figlet/small.flf "Installing Shiny Server"
# Install R shiny. Visit this link to get the latest version:
# https://www.rstudio.com/products/shiny/download-server/

sudo apt-get install gdebi-core
wget https://download3.rstudio.org/ubuntu-18.04/x86_64/shiny-server-1.5.19.995-amd64.deb
sudo gdebi -n shiny-server-1.5.19.995-amd64.deb
sudo ufw allow 3838

sudo rm -R /srv/shiny-server/*
sudo rm -R /srv/shiny-server/.git
sudo rm -R /srv/shiny-server/.gitignore

cd /srv/shiny-server/
git clone https://github.com/DAACS/DAACS-Dashboard .
cp /srv/shiny-server/config-start.R /srv/shiny-server/config.R
# vi /srv/shiny-server/config.R
sudo systemctl restart shiny-server

mkdir /srv/shiny-server/summary_report/generated
chmod 777 /srv/shiny-server/summary_report/generated
chmod 777 /srv/shiny-server/summary_report/summary_report

sudo groupadd shiny-apps
sudo usermod -aG shiny-apps root
sudo usermod -aG shiny-apps shiny
cd /srv/shiny-server
sudo chown -R root:shiny-apps .
sudo chmod g+w .
sudo chmod g+s .

echo "Be sure to edit /srv/shiny-server/config.R"
echo "Probalby want to edit /etc/nginx/nginx.conf too."
