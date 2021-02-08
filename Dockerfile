FROM ubuntu:20.04
WORKDIR /work
RUN apt  -y update && \
	apt -y install software-properties-common  && \
	apt-get -y install clang-10  && \
	apt-get -y install libclang-10-dev && \
	update-alternatives --install /usr/bin/clang clang /usr/bin/clang-10 10  && \
	update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-10 10  && \
	update-alternatives --install /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-10 10  && \
	apt -y install make vim  && \
	apt -y install libudev-dev  && \
	apt -y install libusb-1.0-0-dev && \
	apt -y install -y build-essential cmake zlib1g-dev  golang-go git && \
	git clone https://boringssl.googlesource.com/boringssl  -b 3945 --depth=1 && \
	cd boringssl && mkdir build && cd build && cmake .. && make && \
	mkdir -p /work/openssl/`uname -m`/lib && \ 
	cp ../include /work/openssl/`uname -m`/ -R && \
	cp crypto/libcrypto.a /work/openssl/`uname -m`/lib/ && \
	cp ssl/libssl.a  /work/openssl/`uname -m`/lib/ && \
	cp decrepit/libdecrepit.a  /work/openssl/`uname -m`/lib && \
	cd /work && rm -rf boringssl	
