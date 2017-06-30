apt-get update

#Inginious install
curl -fsSL https://get.docker.com/ | sh #This will setup the Docker repo
dnf install -y git mongodb mongodb-server gcc libtidy python3 python3-pip python3-devel zeromq-devel redhat-rpm-config

systemctl start mongod
systemctl enable mongod
systemctl start docker
systemctl enable docker

pip3 install --upgrade pip

pip3 install --upgrade git+https://github.com/fthuin/INGInious

# Changing inginious configuration file for webapp
cp /vagrant/installer.py /usr/lib/python3.5/site-packages/inginious/frontend/common/

mkdir -p /vagrant/inginious && cd /vagrant/inginious
inginious-install webapp

# Downloading syllabus
mkdir -p /vagrant/syllabus/ && cd /vagrant/syllabus
git clone https://github.com/OpenWeek/java-syllabus-pages.git
git clone https://github.com/OpenWeek/interactive-syllabus.git
ln -s /vagrant/java-syllabus-page/pages /vagrant/interactive-syllabus/syllabus/
cp java-syllabus-pages/cours_inginious/configuration.yaml /vagrant/inginious/
ln -s /vagrant/java-syllabus-pages/cours_inginious/tutorial /vagrant/inginious

cd /vagrant/inginious

inginious-webapp --host 0.0.0.0 --port 8888 &
