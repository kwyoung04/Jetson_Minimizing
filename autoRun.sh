#export USB_DIR=<arg>


### Removing GUI
sudo apt-get -y update
sudo apt-get -y purge libqt5gui5
sudo apt-get -y purge $(cat nvubuntu-focal-packages_only-in-desktop.txt)
sudo apt-get -y install network-manager

### Installing the JetPack Lightweight Version
## /usr/local 
sudo rm -rf $USB_DIR/local
sudo cp -r /usr/local $USB_DIR/local
sudo mv /usr/local /usr/local.origin
sudo ln -s $USB_DIR/local /usr/ 

## /var/cache/apt/ 
sudo rm -rf $USB_DIR/var/cache/apt/
mkdir $USB_DIR/var/cache/
sudo cp -r /var/cache/apt/ $USB_DIR/var/cache/apt/
sudo mv /var/cache/apt/ /var/cache/apt.origin
sudo ln -s $USB_DIR/var/cache/apt/ /var/cache/

## cuda 포함된 jetpack 설치
sudo apt install nvidia-jetpack
sudo apt clean


### Setup Yolo v7
## 환경변수 설정
sh -c "echo \"export PATH="/usr/local/cuda-11.4/bin:$PATH"\" >> ~/.bashrc"
sh -c "echo \"export LD_LIBRARY_PATH="/usr/local/cuda-11.4/lib64:$LD_LIBRARY_PATH"\" >> ~/.bashrc"

## seyup
sudo apt-get -y update 
sudo apt-get -y install autoconf bc build-essential g++-8 gcc-8 clang-8 lld-8 gettext-base gfortran-8 iputils-ping libbz2-dev libc++-dev libcgal-dev libffi-dev libfreetype6-dev libhdf5-dev libjpeg-dev liblzma-dev libncurses5-dev libncursesw5-dev libpng-dev libreadline-dev libssl-dev libsqlite3-dev libxml2-dev libxslt-dev locales moreutils openssl python-openssl rsync scons python3-pip libopenblas-dev;
sudo apt-get -y install python3-pip git

export TORCH_INSTALL=https://developer.download.nvidia.com/compute/redist/jp/v50/pytorch/torch-1.12.0a0+2c916ef.nv22.3-cp38-cp38-linux_aarch64.whl
python3 -m pip install --upgrade pip
python3 -m pip install aiohttp scipy=='1.5.3'
#python3 -m pip install --upgrade protobuf
python3 -m pip install protobuf==4.21.3
python3 -m pip install numpy=='1.21.0'
python3 -m pip install --no-cache $TORCH_INSTALL

## 기본 패키지 설치
pip install pandas tqdm matplotlib seaborn scipy

pip install --upgrade setuptools pip --user
pip install --ignore-installed PyYAML
pip install Pillow

pip install nvidia-pyindex
pip install pycuda

#pip install protobuf<=4.21.3
pip install onnx>=1.9.0
#pip install onnx-simplifier>=0.3.6 --user

pip install nvidia-pyindex
pip install onnx-graphsurgeon
