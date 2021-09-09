python3.6 -m pip freeze > installed.txt
sed -i 's/==.*$//g' installed.txt
sudo -H apt install python3.9-distutils
sudo -H python3.9 -m pip install --upgrade pip
sudo -H python3.9 -m pip install --upgrade setuptools
sudo -H python3.9 -m pip install -r installed.txt
