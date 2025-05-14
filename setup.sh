sudo apt update
sudo apt upgrade
sudo apt install git
ssh-keygen
sudo apt install tig
sudo apt install htop
sudo apt install texlive
sudo apt install texlive-extra-utils
sudo apt install texlive-latex-extra
sudo apt-get install texlive-fonts-extra
sudo apt install texlive-pictures 
sudo apt install texlive-lang-spanish
sudo apt install texlive-lang-english
sudo apt install texlive-lang-french
sudo apt install texlive-science
wget https://julialang-s3.julialang.org/bin/linux/x64/1.9/julia-1.9.3-linux-x86_64.tar.gz
tar zxvf julia-1.9.3-linux-x86_64.tar.gz
mv julia-1.9.3  /opt/julia-1.9.3
sudo ln -s /opt/julia-1.9.3/bin/julia /usr/local/bin/julia
sudo apt install r-base-core
sudo apt install python3-pip
sudo apt install kate
sudo apt install konsole
sudo apt install inkscape
sudo apt install retext
sudo apt install vim
sudo apt install pdftk
sudo apt install hugo
sudo apt install libreoffice
sudo apt-get update

# python
sudo apt install python3-poetry
# begin pyenv
curl -fsSL https://pyenv.run | bash
#
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init - bash)"' >> ~/.bash_profile
#
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc
#
sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python3-openssl
# end pyenv

# multiple ssh-key git
# crear ssh-key antes, subirlas a github
echo 'Host github.com' >> ~/.ssh/config
echo ' HostName github.com' >> ~/.ssh/config
echo ' User git' >> ~/.ssh/config
echo ' IdentityFile ~/.ssh/id_ed25519' >> ~/.ssh/config
echo ' ' >> ~/.ssh/config
echo 'Host github.mutt' >> ~/.ssh/config
echo ' HostName github.com' >> ~/.ssh/config
echo ' User git' >> ~/.ssh/config
echo ' IdentityFile ~/.ssh/id_ed25519_mutt' >> ~/.ssh/config


