sudo modprobe kvm; echo 1 | sudo tee /sys/module/kvm/parameters/ignore_msrs

cd OSX-KVM-highspec
chmod +x ./OpenCore-Boot.sh
./OpenCore-Boot.sh
cd ..
