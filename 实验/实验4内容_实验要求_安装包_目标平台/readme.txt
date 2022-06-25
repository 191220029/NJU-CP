Ubuntu上根据系统的信息，选择对应的qtspim版本，32位还是64位
qtspim其他版本安装包链接：
https://sourceforge.net/projects/spimsimulator/files/

sudo apt-get install qt4-dev-tools
qtspim依赖于qt库，如果dpkg安装失败，则需要安装qt4-dev-tools。
具体qt依赖库可以根据dpkg安装结果提示做相应的修改。
sudo dpkg -i qtspim_9.1.9_linux64.deb

