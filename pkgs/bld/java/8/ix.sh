{% extends '//die/c/make.sh' %}

{% block fetch %}
https://icedtea.classpath.org/download/drops/icedtea8/3.19.0/openjdk.tar.xz
c9d0f566a2cf9d4150a16b7c68b07ccdeeb317b7d055c56f671a0d3d5afd6bd0
https://icedtea.classpath.org/download/drops/icedtea8/3.19.0/corba.tar.xz
19b87e02b27a7312fa0835660159bee55a9e8867fd0013dc36acc057dc331076
https://icedtea.classpath.org/download/drops/icedtea8/3.19.0/hotspot.tar.xz
a2417711339f3c1bb3b32612022e331fe090037b11ef98d989c1fab1acebcab9
https://icedtea.classpath.org/download/drops/icedtea8/3.19.0/jaxp.tar.xz
b9d78eec0ae71332b61e44f71bcf991d3af60663028fdb10bdb1c497cb186f10
https://icedtea.classpath.org/download/drops/icedtea8/3.19.0/jaxws.tar.xz
197053d93fc478adf0645577e85feca004b1496a29dc0d98acc256b1c9be80dd
https://icedtea.classpath.org/download/drops/icedtea8/3.19.0/jdk.tar.xz
3bc3dcaa1f9d109ed99139e1108a691964c68ad90375214a841fd1522aa3829c
https://icedtea.classpath.org/download/drops/icedtea8/3.19.0/langtools.tar.xz
0b94950c68153862c315e1aae62de58a95bc9487ea197723bcb435d6c53d3f22
https://icedtea.classpath.org/download/drops/icedtea8/3.19.0/nashorn.tar.xz
2451e97fe9b4c3d14859170c9621ce1323075e97f6148890ba3644512f3bd695
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/gif
lib/c++
lib/png
lib/jpeg
lib/cups
lib/alsa
lib/kernel
lib/lcms/2
lib/freetype
lib/shim/iced
{% endblock %}

{% block bld_tool %}
bin/zip
bld/bash
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
nashorn
{% endblock %}

{% block step_unpack %}
extract 1 ${src}/openjdk.tar.xz
{% for x in ix.parse_list(self.parts()) %}
mkdir {{x}}
cd {{x}}
extract 1 ${src}/{{x}}.tar.xz
cd ..
{% endfor %}
{% endblock %}


{% block build %}
export IX_JAVA_HOME=${JAVA_HOME}
export IMPORT_JDK=${PWD}/jdk
export BUILD_DIR=${PWD}/build
export ANT_OPTS=-Djava.io.tmpdir=${TMPDIR}
unset CLASSPATH
unset JAVA_HOME
#mkdir -p build/linux-amd64
{{super()}}
{% endblock %}

{% block script_init_env %}
export PLUGINS=
export CLASSPATH=
{{super()}}
{% endblock %}

{% block make_flags %}
CC=${CC}
CXX=${CXX}
CCC=${CXX}
BUILD_GCC=${CC}
BUILD_CPP=${CXX}
COMPILER_PATH=" "
RMIC_JAVA=${JAVA}
ALT_BOOTDIR=${IX_JAVA_HOME}
UNIXCOMMAND_PATH=" "
USRBIN_PATH=" "
UTILS_COMMAND_PATH=" "
UTILS_USR_BIN_PATH=" "
USER=root
LOGNAME=root
TEST_IN_BUILD=false
CUPS_HEADERS_PATH=${CUPS_HEADERS_PATH}
REQUIRED_FREETYPE_VERSION=2.14.1
REQUIRED_ALSA_VERSION=
DISABLE_HOTSPOT_OS_VERSION_CHECK=1
USE_PRECOMPILED_HEADER=0
SORT=sort
BUILD_HEADLESS_ONLY=yes
NO_DOCS=true
HOTSPOT_BUILD_JOBS=8
{% endblock %}

{% block build_flags %}
wrap_cc
shut_up
{% endblock %}

{% block cpp_defines1 %}
isnanf=isnan
SIGCLD=SIGCHLD
__SIGRTMAX=SIGRTMAX
HAS_GLIBC_GETHOSTBY_R=1
{% endblock %}

{% block c_flags1 %}
-Wno-implicit-function-declaration
{% endblock %}

{% block make_no_thrs %}
{% endblock %}

{% block configure %}
sh ./configure
{% endblock %}
