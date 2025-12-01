{% extends '//bin/java/boot/oracle/t/ix.sh' %}

{% block bld_libs %}
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
bin/zip
bin/wget
bin/gzip
bld/perl
bin/unzip
bin/fastjar
bin/getconf
bin/xsltproc
bld/fake/binutils
bld/java/boot/free
bld/java/boot/jamvm/jdk
{% endblock %}

{% block patch %}
cat jdk/make/tools/Makefile \
    | grep -v compile_font_config \
    | grep -v dtdbuilder \
    > _
mv _ jdk/make/tools/Makefile
{% endblock %}

{% block build %}
unset CLASSPATH
unset JAVA_HOME
mkdir -p ./build/linux-amd64
mkdir -p build/linux-amd64/langtools/build/genstubs/java/io
base64 -d << EOF > build/linux-amd64/langtools/build/genstubs/java/io/File.java
{% include 'File.java/base64' %}
EOF
base64 -d << EOF > build/linux-amd64/langtools/build/genstubs/java/io/FileSystem.java
{% include 'FileSystem.java/base64' %}
EOF
mkdir -p build/linux-amd64/btjars
>build/linux-amd64/btjars/jarreorder.jar
{{super()}}
{% endblock %}

{% block make_flags %}
CC=cc
UNIXCOMMAND_PATH=" "
USRBIN_PATH=" "
UTILS_COMMAND_PATH=" "
UTILS_USR_BIN_PATH=" "
CUPS_HEADERS_PATH=${CUPS_HEADERS_PATH}
REQUIRED_FREETYPE_VERSION=2.14.1
REQUIRED_ALSA_VERSION=
REQUIRED_BOOT_VER=1.5.0
USER=root
LOGNAME=root
ALT_OBJCOPY=$(which objcopy)
ALT_BOOTDIR=${PWD}/prev
BOOT_JAVA_HOME=${PWD}/prev
ALT_JDK_IMPORT_PATH=${PWD}/prev
BUILD_LANGTOOLS=true
BUILD_JAXP=false
BUILD_JAXWS=false
BUILD_CORBA=false
BUILD_HOTSPOT=false
BUILD_JDK=true
DISABLE_HOTSPOT_OS_VERSION_CHECK=yes
{% endblock %}
