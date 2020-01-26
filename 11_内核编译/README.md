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

安装`gcc-multilab`

```bash
sudo apt-get install gcc-multilib g++-multilib
```

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

环境变量配置

```bash

```

`binutils`配置

```

```

