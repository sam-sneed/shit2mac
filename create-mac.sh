hdd_size=${1:-256}

sudo apt-get install qemu uml-utilities virt-manager git \
    wget libguestfs-tools p7zip-full make dmg2img tesseract-ocr \
    tesseract-ocr-eng genisoimage -y

git clone --depth 1 --recursive https://github.com/sam-sneed/OSX-KVM-highspec

cd OSX-KVM-highspec

sudo modprobe kvm; echo 1 | sudo tee /sys/module/kvm/parameters/ignore_msrs

sudo usermod -aG kvm $(whoami)
sudo usermod -aG libvirt $(whoami)
sudo usermod -aG input $(whoami)

./fetch-macOS-v2.py -s ventura
dmg2img -i "com.apple.recovery.boot/BaseSystem.dmg" BaseSystem.img

qemu-img create -f qcow2 mac_hdd_ng.img "$hdd_size"G

cd ..

echo "macOS ready to boot and install, please execute the run script!"
