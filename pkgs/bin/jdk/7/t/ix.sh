{% extends '//die/c/make.sh' %}

{% block fetch %}
https://icedtea.classpath.org/download/drops/icedtea7/2.6.13/openjdk.tar.bz2
14a9f90e2fe5c0bb73dc8ffcc9ea5dc76d3ce7a74a0c901cfd0b0ae3fc8c6450
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
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block bld_tool %}
bin/zip
bin/unzip
bld/java/7
bld/devendor
{% endblock %}

{% block parts %}
corba
hotspot
jaxp
jaxws
jdk
langtools
{% endblock %}

{% block step_unpack %}
extract 1 ${src}/openjdk.tar.bz2
{% for x in ix.parse_list(self.parts()) %}
extract 0 ${src}/{{x}}.tar.bz2
mv {{x}}-* {{x}}
{% endfor %}
{% endblock %}

{% block patch %}
cp jdk/src/share/lib/security/nss.cfg.in jdk/src/share/lib/security/nss.cfg
(cd hotspot/src/share/vm/runtime; base64 -d | patch -p1) << EOF
{% include '//bld/java/boot/iced/t/so.patch/base64' %}
EOF
(cd jdk/src/solaris/native/java/net; base64 -d | patch -p1) << EOF
{% include '//bld/java/boot/iced/t/lc.patch/base64' %}
EOF
sed -e 's|const char \* const|extern const char \* const|' \
    -i jdk/src/solaris/native/java/lang/childproc.h
echo 'const char * const *parentPathv;' >> jdk/src/solaris/native/java/lang/childproc.c
sed -e 's|xawt||g' -i jdk/make/sun/Makefile
sed -e 's|headless||g' -i jdk/make/sun/Makefile
devendor jdk/src/share/native/sun/font
devendor jdk/src/solaris/native/sun/font
devendor jdk/src/share/native/sun/awt
devendor jdk/src/solaris/native/sun/awt
devendor jdk/src/share/native/sun/java2d
devendor jdk/src/solaris/native/sun/java2d
sed -e 's|.*throw.*RuntimeException.*time.*10.*||' \
    -i jdk/make/tools/src/build/tools/generatecurrencydata/GenerateCurrencyData.java
(cd hotspot; base64 -d | patch -p1) << EOF
{% include '//bld/java/boot/iced/t/icedtea-7-hotspot-pointer-comparison.patch/base64' %}
EOF
find hotspot -type f -name '*.hpp' | while read l; do
    sed -e 's|(-1) <<|((unsigned)(-1)) << |' -i ${l}
done
find . -type f -name '*.gmk' | while read l; do
    sed -e 's|/usr/bin/echo|echo|' \
        -e 's|/bin/echo|echo|' \
        -i ${l}
done
{% endblock %}

{% block build %}
export IX_JAVA_HOME=${JAVA_HOME}
export IMPORT_JDK=${PWD}/jdk
export BUILD_DIR=${PWD}/build
export ANT_OPTS=-Djava.io.tmpdir=${TMPDIR}
unset CLASSPATH
unset JAVA_HOME
mkdir -p build/linux-amd64
{{super()}}
{% endblock %}

{% block script_init_env %}
export PLUGINS=
export CLASSPATH=
{{super()}}
{% endblock %}

{% block make_flags %}
CC=${CC}
USER=root
SORT=sort
CXX=${CXX}
CCC=${CXX}
LOGNAME=root
NO_DOCS=true
USRBIN_PATH=" "
BUILD_GCC=${CC}
BUILD_CPP=${CXX}
COMPILER_PATH=" "
RMIC_JAVA=${JAVA}
TEST_IN_BUILD=false
HOTSPOT_BUILD_JOBS=8
UNIXCOMMAND_PATH=" "
UTILS_COMMAND_PATH=" "
UTILS_USR_BIN_PATH=" "
REQUIRED_ALSA_VERSION=
BUILD_HEADLESS_ONLY=yes
USE_PRECOMPILED_HEADER=0
ALT_BOOTDIR=${IX_JAVA_HOME}
REQUIRED_FREETYPE_VERSION=2.14.1
DISABLE_HOTSPOT_OS_VERSION_CHECK=1
CUPS_HEADERS_PATH=${IX_CUPS_CUPS_H_DIR}/include
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

{% block make_no_thrs %}
{% endblock %}
