#!/usr/bin/env bash
# filename: biodynamo_install.sh
######################################################################################
#     SCRIP DE INSTALACIÓN POR LINEA DE COMANDOS DE TERMINAL PARA UBUNTU 22.04       #
#     AUTOR: MARCO BATURAN, FECHA: 1 JUNIO 2023, COPYRIGHT: NONE                     #
#     COMPLEMENTO A LA GUIA DE INTRODUCCION DE BIODYNAMO.                            #
######################################################################################

# instala paquetes básicos
sudo apt-get update
sudo apt-get install -y wget curl make gcc g++ libblas-dev liblapack-dev libopenmpi-dev libomp5 libomp-dev libnuma-dev freeglut3-dev libpthread-stubs0-dev

# Prepara GCC y CMAKE para compilar
curl -L -O https://github.com/Kitware/CMake/releases/download/v3.19.3/cmake-3.19.3-Linux-x86_64.sh
chmod +x cmake-3.19.3-Linux-x86_64.sh
sudo ./cmake-3.19.3-Linux-x86_64.sh --skip-license --prefix=/usr/local

# librerías del entorno
sudo apt-get install -y libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl

# instala librería de entorno de python 
curl https://pyenv.run | bash
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.9.1

# instala paquetes de python
pyenv shell 3.9.1
python -m pip install markupsafe==2.0.1 jupyter metakernel jupyterlab nbformat==5.4.0 nbconvert==6.5.3 nbclient==0.6.6
sudo apt-get install -y valgrind clang-format clang-tidy doxygen graphviz libxml2-dev libgsl-dev libgit2-dev

# on Ubuntu 22.04
sudo apt-get install -y kcov

#!/bin/bash
# Instalar biodynamo
 # Crear la carpeta raíz
echo "Salimos a carpeta raíz"
cd ~
 # Crear la carpeta programas
echo "Creamos la carpeta investigación."
mkdir -p investigacion
 # Entrar en la carpeta programas
echo "Entramos en carpeta investigación."
cd investigacion
 # Crear la carpeta BioDynamo
echo "Creamos la carpeta BioDynamo."
mkdir -p BioDynamo
 # Entrar en la carpeta BioDynamo
echo "Entramos en las carpeta BioDynamo."
cd BioDynamo
 # Clonar el repositorio
echo "Clonamos el repositorio."
git clone https://github.com/BioDynaMo/biodynamo.git
 # Entrar en la carpeta biodynamo
echo "Entramos en el repositorio."
cd biodynamo
 # Ejecutar la instalación
echo "Ejecutamos la instalación."
sudo ./install.sh
echo "Fin de la instalación completa."
