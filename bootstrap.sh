#apt-get update

sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config 

#Inginious install
dnf install -y git mongodb mongodb-server gcc libtidy python3 python3-pip python3-devel zeromq-devel redhat-rpm-config docker xmlsec1-openssl python3-xmlsec

systemctl start mongod
systemctl enable mongod
systemctl start docker
systemctl enable docker

pip3 install --upgrade pip

# for syllabus webapp
/usr/local/bin/pip3 install flask
# for rst syntax highlighting
/usr/local/bin/pip3 install pygments

/usr/local/bin/pip3 install --upgrade git+https://github.com/UCL-INGI/INGInious@v0.5

# Changing inginious configuration file for webapp
cp /vagrant/files_to_copy/installer.py /usr/local/lib/python3.6/site-packages/inginious/frontend/

mkdir -p /vagrant/inginious && cd /vagrant/inginious
sudo inginious-install
cp /vagrant/files_to_copy/ingi_config.yaml ./configuration.yaml

git clone https://github.com/tdba/CS1-Python

# Downloading syllabus
mkdir -p /vagrant/syllabus/ && cd /vagrant/syllabus
git clone https://github.com/tdba/FDP-Python-Syllabus-Pages || true
git clone https://github.com/OpenWeek/interactive-syllabus.git || true
cd interactive-syllabus
cp -r /vagrant/syllabus/FDP-Python-Syllabus-Pages /vagrant/syllabus/interactive-syllabus/pages
cp /vagrant/syllabus/interactive-syllabus/configuration_default.yaml /vagrant/syllabus/interactive-syllabus/configuration.yaml
sudo pip3 install .

chmod +x /vagrant/run_inginious
chmod +x /vagrant/run_syllabus
sudo cp /vagrant/run_inginious /usr/sbin/ || true
sudo cp /vagrant/run_syllabus  /usr/sbin/ || true
cp /vagrant/files_to_copy/.bashrc /home/vagrant/.bashrc
source /home/vagrant/.bashrc

cp -r  /vagrant/inginious /home/vagrant/

sudo run_syllabus > /dev/null &
sudo run_inginious &
