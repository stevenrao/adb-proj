# adb-proj
# adb 1.0.41 (x86_64 and arm64)
the project is build adb from souce code. the adb verson is 1.0.41.  code base on android10-release code. 
i can build the source on linux x86_64 system, and arm64 system success！

there I didn't provide a arm cross compile environment. but only the release binary is provided.(because i build it on a pure linux arm os system（such as MacBook Air M1）, so i don't need cross compile environment :). If you can, please help modify&create a cross compiling environment、makefile to improve the project )

### Directory structure description
```
├── adb
├── depend
├── Dockerfile
├── Makefile
```
#### 1、 adb folder 
it  is adb source code base on platform/system/core/adb  branch android10-release。 you can get as follow
```
git clone https://android.googlesource.com/platform/system/core -b android10-release --depth=1
```
#### 2、depend folder
it is the needed denpend source or header code when build adb， the codes are collected from core folder.

#### 3、Makefile
to  build the source  to adb executable  binary file  
 
#### 4、Dockerfile
the build platform; include :
1) clang-10/clang++-10  the source require c++20. 

2) openssl library,  build from boringssl. 

3) libusb,  install from apt package

### how to build
#### 1、construct docker images
```
cd adb-proj && docker build -t adb-build-env .
（also the docker image you can get from docker-hub 
docker pull raochaoxun/adb-build-env-aarch64:1.0.0
or
docker pull raochaoxun/adb-build-env-x86-64:1.0.0
）
```

#### 2、build code
```
cd adb-proj

docker run -it --rm --name adb-build -v xxxx/xxx/adb-proj:/work/adb-proj  adb-build-env:latest  /bin/bash

cd adb-proj 

make

```

# to do

build adb base on Android 11 with adb wifi features
