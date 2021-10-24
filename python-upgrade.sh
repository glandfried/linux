python3.6 -m pip freeze > installed.txt
sed -i 's/==.*$//g' installed.txt
sudo -H apt install python3.9-distutils
sudo -H python3.9 -m pip install --upgrade pip
sudo -H python3.9 -m pip install --upgrade setuptools
sudo -H python3.9 -m pip install -r installed.txt
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1
sudo update-alternatives --config python3 # Enter 2 for Python 3.9
# Test
python3 --version


