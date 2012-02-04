#!/bin/sh
# Copyright (c) 2011 The Open Source Geospatial Foundation.
# Licensed under the GNU LGPL.
# 
# This library is free software; you can redistribute it and/or modify it
# under the terms of the GNU Lesser General Public License as published
# by the Free Software Foundation, either version 2.1 of the License,
# or any later version.  This library is distributed in the hope that
# it will be useful, but WITHOUT ANY WARRANTY, without even the implied
# warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU Lesser General Public License for more details, either
# in the "LICENSE.LGPL.txt" file distributed with this software or at
# web page "http://www.fsf.org/licenses/lgpl.html".

# About:
# =====
# This script will install openjdk version 7
#
# for Natty see also http://brunoreis.com/tech/intalling-java-ubuntu-natty/
#
# for Ubuntu >=11.10 openjdk-7 is in the official archives:
#apt-get install openjdk-7-jre icedtea-plugin ttf-dejavu-extra
# (or `apt-get install openjdk-7-jdk`)


TMP="/tmp/build_openjdk"
USER_NAME="user"
USER_HOME="/home/$USER_NAME"

mkdir -p "$TMP"
cd "$TMP"

# Download and uncompress openjdk
wget -c --progress=dot:mega \
   "http://download.oracle.com/otn-pub/java/jdk/7/jdk-7-linux-i586.tar.gz"
tar -zxf jdk-7-linux-i586.tar.gz

# Move JDK 7 directory to the /usr/lib/jvm/jdk1.7.0 directory.
mkdir -p /usr/lib/jvm
mv ./jdk1.7.0/ /usr/lib/jvm/jdk1.7.0
ln -s /usr/lib/jvm/jdk1.7.0 /usr/lib/jvm/java-7-sun


# make it easy for developers to switch VMs
if [ `grep -c JAVA_HOME "$USER_HOME/.profile"` -eq 0 ] ; then
   echo >> "$USER_HOME/.profile"
   echo "# Uncomment the following line to use the OpenJDK java VM" \
      >> "$USER_HOME/.profile"
   echo "#JAVA_HOME=/usr/lib/jvm/java-7-sun; export JAVA_HOME" \
      >> "$USER_HOME/.profile"
fi
