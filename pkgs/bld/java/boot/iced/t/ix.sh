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

{% block bld_tool %}
bin/zip
bin/gzip
bld/perl
bin/unzip
bld/prepend
bin/getconf
bin/xsltproc
bld/devendor
bld/java/boot/free
bld/java/boot/ecj/jdk
bld/fake(tool_name=ldd)
bld/fake(tool_name=wget)
bld/java/boot/iced/readelf
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
(cd openjdk.src/hotspot/src/share/vm/runtime; base64 -d | patch -p1) << EOF
{% include 'so.patch/base64' %}
EOF
(cd openjdk.src/jdk/src/solaris/native/java/net; base64 -d | patch -p1) << EOF
{% include 'lc.patch/base64' %}
EOF
sed -e 's|const char \* const|extern const char \* const|' \
    -i openjdk.src/jdk/src/solaris/native/java/lang/childproc.h
echo 'const char * const *parentPathv;' >> openjdk.src/jdk/src/solaris/native/java/lang/childproc.c
sed -e 's|xawt||g' -i openjdk.src/jdk/make/sun/Makefile
sed -e 's|headless||g' -i openjdk.src/jdk/make/sun/Makefile
devendor openjdk.src/jdk/src/share/native/sun/font
devendor openjdk.src/jdk/src/solaris/native/sun/font
devendor openjdk.src/jdk/src/share/native/sun/awt
devendor openjdk.src/jdk/src/solaris/native/sun/awt
devendor openjdk.src/jdk/src/share/native/sun/java2d
devendor openjdk.src/jdk/src/solaris/native/sun/java2d
sed -e 's|.*Using java runtime at.*||' \
    -i openjdk.src/hotspot/src/share/tools/launcher/java.c
sed -e 's|.*throw.*RuntimeException.*time.*10.*||' \
    -i openjdk.src/jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData.java
(cd openjdk.src/hotspot; base64 -d | patch -p1) << EOF
{% include 'icedtea-7-hotspot-pointer-comparison.patch/base64' %}
EOF
find openjdk.src/hotspot -type f -name '*.hpp' | while read l; do
    sed -e 's|(-1) <<|((unsigned)(-1)) << |' -i ${l}
done
find openjdk.src/hotspot/make -type f -name '*.make' | while read l; do
prepend ${l} << EOF
USE_PRECOMPILED_HEADER=0
EOF
done
find patches -type f -name 'ecj*' | while read l; do
    rm ${l}
    touch ${l}
done
find . -type f -name '*.gmk' | while read l; do
    sed -e 's|/usr/bin/echo|echo|' \
        -e 's|/bin/echo|echo|' \
        -i ${l}
done
{% endblock %}

{% block make_flags %}
SORT=sort
USER=root
LOGNAME=root
USRBIN_PATH=" "
UNIXCOMMAND_PATH=" "
UTILS_COMMAND_PATH=" "
UTILS_USR_BIN_PATH=" "
REQUIRED_ALSA_VERSION=
BUILD_HEADLESS_ONLY=yes
USE_PRECOMPILED_HEADER=0
REQUIRED_FREETYPE_VERSION=2.14.1
DISABLE_HOTSPOT_OS_VERSION_CHECK=1
ALT_CUPS_HEADERS_PATH=${IX_CUPS_CUPS_H_DIR}/include
{% endblock %}

{% block build_flags %}
wrap_cc
shut_up
{% endblock %}

{% block cpp_defines %}
isnanf=isnan
SIGCLD=SIGCHLD
__SIGRTMAX=SIGRTMAX
HAS_GLIBC_GETHOSTBY_R=1
{% endblock %}

{% block c_flags %}
-Wno-implicit-function-declaration
{% endblock %}

{% block make_target %}
stamps/icedtea-boot.stamp
{% endblock %}
