#### `ubuntu`交叉编译环境

环境查看

```bash
dpkg --print-architecture
```

确认是否打开多架构支持功能,输出应该为`i386`

```bash
dpkg --print-foreign-architectures
```

如果没有,手动打开

```bash
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get dist-upgrade
```

安装`gcc-multilab`,可能会需要更换源

编译时添加

```
-m32
```

```bash
sudo apt-get install gcc-multilib g++-multilib
```

------------

#### 推荐以下方法,上述方法在有些地方编译时会出错

安装`gmp`,`mpfr`,`libmpc`,`libmpfr`

```bash
sudo apt-get install libmpfr-dev
```

`gmp`下载地址

```
https://gmplib.org/
```

解压进入目录

```bash
./configure --enable-cxx
make -j8
make check
sudo make install
```

`mpc`下载地址

```bash
wget http://mirror.hust.edu.cn/gnu/mpc/mpc-1.1.0.tar.gz
```

解压进入目录

```bash
./configure --enable-cxx
make -j8
make check
sudo make install
```

........

`gcc`环境变量配置,根据自己实际路径修改

```bash
export CC=/usr/local/bin/gcc-4.9
export LD=/usr/local/bin/gcc-4.9
export PREFIX="/usr/local/i386elfgcc"
export TARGET=i386-elf
export PATH="$PREFIX/bin:$PATH"
```

`binutils`配置

```bash
mkdir /tmp/src
cd /tmp/src
curl -O http://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.gz 
tar xf binutils-2.24.tar.gz
mkdir binutils-build
cd binutils-build
../binutils-2.24/configure --target=$TARGET --enable-interwork --enable-multilib --disable-nls --disable-werror --prefix=$PREFIX 2>&1 | tee configure.log
make all install 2>&1 | tee make.log
```

`gcc`配置



```bash
cd /tmp/src
curl -O https://ftp.gnu.org/gnu/gcc/gcc-4.9.1/gcc-4.9.1.tar.bz2
tar xf gcc-4.9.1.tar.bz2
mkdir gcc-build
cd gcc-build
../gcc-4.9.1/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --disable-libssp --enable-languages=c --without-headers
make all-gcc 
make all-target-libgcc 
make install-gcc 
make install-target-libgcc 
```

