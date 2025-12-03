{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://icedtea.classpath.org/download/source/icedtea-2.6.13.tar.xz
104e84205d1176e217e24f770784c53d1cd666aeb23ab0bae8ac858e5b0e63f0
https://icedtea.classpath.org/download/drops/icedtea7/2.6.13/corba.tar.bz2
df1154915cad317b93555b563fc12acad1b92e5f2870642736f186b7a4d80f14
https://icedtea.classpath.org/download/drops/icedtea7/2.6.13/hotspot.tar.bz2
9ae3d6d43ff771cf02b8c7805ac0f0a457f5fa7026b1334ea1085262d3d86d9d
https://icedtea.classpath.org/download/drops/icedtea7/2.6.13/jaxp.tar.bz2
143a5b957fbb00889ff9d38a4bf391218786b6a33664235279edbb6e79a3decc
https://icedtea.classpath.org/download/drops/icedtea7/2.6.13/jaxws.tar.bz2
d3e3d55d6e2231c4420d30d124f72c56695d45e8a398e3cc7ba21ff2a93c1284
https://icedtea.classpath.org/download/drops/icedtea7/2.6.13/jdk.tar.bz2
adbda93d1e9be89447e009733a6c9050c6e6cebda3c674a76ebbeb8986623534
https://icedtea.classpath.org/download/drops/icedtea7/2.6.13/langtools.tar.bz2
12036b985f8811cdadf6d5bf840f90bab25f4da1cc3e86bab9c3f6efcc10055b
https://icedtea.classpath.org/download/drops/icedtea7/2.6.13/openjdk.tar.bz2
14a9f90e2fe5c0bb73dc8ffcc9ea5dc76d3ce7a74a0c901cfd0b0ae3fc8c6450
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block parts %}
corba
hotspot
jaxp
jaxws
jdk
langtools
{% endblock %}

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
lib/shim/fake/pkg(pkg_name=xt,pkg_ver=100500)
lib/shim/fake/pkg(pkg_name=x11,pkg_ver=100500)
lib/shim/fake/pkg(pkg_name=xinerama,pkg_ver=100500)
lib/shim/fake/pkg(pkg_name=xrender,pkg_ver=100500)
lib/shim/fake/pkg(pkg_name=xcomposite,pkg_ver=100500)
lib/shim/fake/pkg(pkg_name=xtst,pkg_ver=100500)
{% endblock %}

{% block bld_tool %}
bin/zip
bin/wget
bin/gzip
bld/perl
bin/unzip
bin/getconf
bin/xsltproc
bld/java/boot/free
bld/java/boot/jamvm/jdk
{% endblock %}

{% block configure_flags %}
--disable-docs
--without-rhino
--enable-bootstrap
--disable-system-gtk
--disable-system-gio
--disable-downloading
--disable-system-sctp
--disable-system-pcsc
--disable-system-gconf
--disable-system-kerberos
--with-jdk-home=${JAVA_HOME}
--with-parallel-jobs=${make_thrs}
--disable-compile-against-syscalls
--with-openjdk-src-dir=${PWD}/openjdk.src
{% endblock %}

{% block step_unpack %}
{{super()}}
mkdir openjdk.src
cd openjdk.src
extract 1 ${src}/openjdk.tar.bz2
{% for x in ix.parse_list(self.parts()) %}
extract 0 ${src}/{{x}}.tar.bz2
mv {{x}}-* {{x}}
{% endfor %}
cd ..
{% endblock %}

{% block patch %}
find patches -type f -name 'ecj*' | while read l; do
    rm ${l}
    touch ${l}
done
find . -type f -name '*.gmk' | while read l; do
    sed -e 's|/usr/bin/echo|echo|' \
        -e 's|/bin/echo|echo|' \
        -i ${l}
done
export X=openjdk.build-boot/langtools/build/genstubs
mkdir -p ${X}/java/io
base64 -d << EOF > ${X}/java/io/File.java
{% include 'File.java/base64' %}
EOF
base64 -d << EOF > ${X}/java/io/FileSystem.java
{% include 'FileSystem.java/base64' %}
EOF
{% endblock %}

{% block make_flags %}
UNIXCOMMAND_PATH=" "
USRBIN_PATH=" "
UTILS_COMMAND_PATH=" "
UTILS_USR_BIN_PATH=" "
USER=root
LOGNAME=root
CUPS_HEADERS_PATH=${CUPS_HEADERS_PATH}
REQUIRED_FREETYPE_VERSION=2.14.1
REQUIRED_ALSA_VERSION=
DISABLE_HOTSPOT_OS_VERSION_CHECK=1
{% endblock %}

{% block build %}
export IX_EXTRA_SP=${PWD}/openjdk-boot/jaxws/src/share/jaxws_classes
export IX_EXTRA_SP_JAXP=${PWD}/openjdk-boot/jdk/src/solaris/classes:${PWD}/openjdk-boot/jdk/src/share/classes:${PWD}/generated.build
{{super()}}
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
