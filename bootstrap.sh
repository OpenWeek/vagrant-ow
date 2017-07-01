#apt-get update

sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config 

#Inginious install
curl -fsSL https://get.docker.com/ | sh #This will setup the Docker repo
dnf install -y git mongodb mongodb-server gcc libtidy python3 python3-pip python3-devel zeromq-devel redhat-rpm-config

systemctl start mongod
systemctl enable mongod
systemctl start docker
systemctl enable docker

pip3 install --upgrade pip

# for syllabus webapp
pip3 install flask
# for rst syntax highlighting
pip3 install pygments

pip3 install --upgrade git+https://github.com/fthuin/INGInious

# Changing inginious configuration file for webapp
cp /vagrant/files_to_copy/installer.py /usr/lib/python3.5/site-packages/inginious/frontend/common/

mkdir -p /vagrant/inginious && cd /vagrant/inginious
inginious-install webapp

# Downloading syllabus
mkdir -p /vagrant/syllabus/ && cd /vagrant/syllabus
git clone https://github.com/OpenWeek/java-syllabus-pages.git || true
git clone https://github.com/OpenWeek/interactive-syllabus.git || true
ln -s -f /vagrant/syllabus/java-syllabus-pages/pages /vagrant/syllabus/interactive-syllabus/syllabus/ || true
cp -f /vagrant/syllabus/java-syllabus-pages/cours_inginious/configuration.yaml /vagrant/inginious/ || true
ln -s -f /vagrant/syllabus/java-syllabus-pages/cours_inginious/tutorial /vagrant/inginious || true

chmod +x /vagrant/run_inginious
chmod +x /vagrant/run_syllabus
sudo cp /vagrant/run_inginious /usr/sbin/ || true
sudo cp /vagrant/run_syllabus  /usr/sbin/ || true
cp /vagrant/files_to_copy/.bashrc /home/vagrant/.bashrc
source /home/vagrant/.bashrc
cp -f /vagrant/files_to_copy/syllabus_config.py /vagrant/syllabus/interactive-syllabus/syllabus/config.py

cp -r  /vagrant/inginious /home/vagrant/

sudo run_inginious &
sudo run_syllabus &
