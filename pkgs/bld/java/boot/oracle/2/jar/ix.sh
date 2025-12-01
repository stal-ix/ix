{% extends '//bld/java/boot/oracle/t/ix.sh' %}

{% block bins %}
appletviewer
jarsigner
keytool
jar
native2ascii
serialver
javah
rmiregistry
tnameserv
orbd
rmid
rmic
{% endblock %}

{% block bld_libs1 %}
lib/c
lib/z
lib/gif
lib/c++
lib/png
lib/jpeg
lib/cups
lib/alsa
lib/lcms/2
lib/freetype
aux/x11/proto
{% endblock %}

{% block bld_tool %}
#bin/zip
#bin/wget
#bin/gzip
#bld/perl
#bin/unzip
#bin/fastjar
#bin/getconf
#bin/xsltproc
#bld/fake/binutils
bld/java/boot/free
bld/java/boot/ant/9
bld/java/boot/oracle/1
bld/java/boot/jamvm/good
bld/java/boot/classpath/devel
{% endblock %}

{% block build %}
export IX_CLASSPATH=${CLASSPATH}
export IX_JAVA_HOME=${JAVA_HOME}
mkdir -p prev/bin
cp -R ${JAVA_HOME}/* prev/
{% for x in ix.parse_list(self.bins()) %}
cat << EOF > prev/bin/{{x}}
#!/usr/bin/env sh
exec g{{x}} "\${@}"
EOF
{% endfor %}
cat << EOF > prev/bin/javac
#!/usr/bin/env sh
exec $(which javac) "\${@}"
EOF
cat << EOF > prev/bin/java
#!/usr/bin/env sh
exec jamvm -classpath \${IX_CLASSPATH} "\${@}"
EOF
mkdir prev/jre
cp -R prev/lib prev/jre/
chmod +x prev/bin/*
unset CLASSPATH
unset JAVA_HOME
export IX_JAVACMD=${PWD}/prev/bin/java
export PATH=${PWD}/prev/bin:${PATH}
mkdir -p ./build/linux-amd64
mkdir -p build/linux-amd64/langtools/build/genstubs/java/io
base64 -d << EOF > build/linux-amd64/langtools/build/genstubs/java/io/File.java
{% include 'File.java/base64' %}
EOF
base64 -d << EOF > build/linux-amd64/langtools/build/genstubs/java/io/FileSystem.java
{% include 'FileSystem.java/base64' %}
EOF
{{super()}}
{% endblock %}

{% block make_flags %}
CC=cc
UNIXCOMMAND_PATH=" "
USRBIN_PATH=" "
UTILS_COMMAND_PATH=" "
UTILS_USR_BIN_PATH=" "
REQUIRED_BOOT_VER=1.5.0
USER=root
LOGNAME=root
ALT_BOOTDIR=${PWD}/prev
BOOTDIR=${PWD}/prev
BOOT_JAVA_HOME=${PWD}/prev
ALT_JDK_IMPORT_PATH=${PWD}/prev
JAVAC_CMD=${PWD}/prev/bin/javac
{% endblock %}

{% block make_target %}
langtools
{% endblock %}

{% block install %}
cp -R build/linux-amd64/langtools/dist/bootstrap ${out}/
cp build/linux-amd64/langtools/dist/lib ${out}/lib/
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export JDK_BOOT_PATH=${out}
{% endblock %}
