{% extends '//die/c/configure.sh' %}

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
mkdir src
cd src
extract 1 ${src}/openjdk.tar.xz
{% for x in self.parts() | parse_list %}
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
{{super()}}
{% endblock %}

{% block script_init_env %}
export CLASSPATH=
{{super()}}
{% endblock %}

{% block build_flags %}
wrap_cc
shut_up
wrap_rdynamic
{% endblock %}

{% block cpp_defines %}
isnanf=isnan
CLONE_VM=0
CLONE_VFORK=0
SIGCLD=SIGCHLD
__SIGRTMAX=SIGRTMAX
HAS_GLIBC_GETHOSTBY_R=1
{% endblock %}

{% block c_flags %}
-Wno-implicit-function-declaration
{% endblock %}

{% block cxx_flags %}
-std=c++98
{% endblock %}

{% block make_no_thrs %}
{% endblock %}

{% block configure_flags %}
--with-toolchain-type=clang
--disable-headful
--without-x
{% endblock %}

{% block patch %}
devendor jdk/src/share/native/sun/font
devendor jdk/src/solaris/native/sun/font
devendor jdk/src/share/native/sun/awt
devendor jdk/src/solaris/native/sun/awt
devendor jdk/src/share/native/sun/java2d
devendor jdk/src/solaris/native/sun/java2d
find langtools/src/share/classes/com/sun/tools/javac/parser -type f -name '*.java' | while read l; do
    sed \
        -e 's| Token | XXToken |g' \
        -e 's| Token(| XXToken(|g' \
        -e 's| Token\.| XXToken\.|g' \
        -e 's| Token\[| XXToken\[|g' \
        -e 's| Token<| XXToken<|g' \
        -e 's|(Token |(XXToken |g' \
        -e 's|(Token(|(XXToken(|g' \
        -e 's|(Token\.|(XXToken\.|g' \
        -e 's|(Token\[|(XXToken\[|g' \
        -e 's|(Token<|(XXToken<|g' \
        -e 's|\.Token |\.XXToken |g' \
        -e 's|\.Token(|\.XXToken(|g' \
        -e 's|\.Token\.|\.XXToken\.|g' \
        -e 's|\.Token\[|\.XXToken\[|g' \
        -e 's|\.Token<|\.XXToken<|g' \
        -e 's|<Token |<XXToken |g' \
        -e 's|<Token(|<XXToken(|g' \
        -e 's|<Token\.|<XXToken\.|g' \
        -e 's|<Token\[|<XXToken\[|g' \
        -e 's|<Token>|<XXToken>|g' \
        -e 's|NamedXXToken|NamedToken|' \
        -e 's|StringXXToken|StringToken|' \
        -e 's|NumericXXToken|NumericToken|' \
        -i ${l}
done
find hotspot -type f -name '*.hpp' | while read l; do
    sed -e 's|(-1) <<|((unsigned)(-1)) << |' -i ${l}
done
find jdk -type f -name '*.h' | while read l; do
    sed -e 's|(-1)<<|((unsigned)(-1)) << |' -i ${l}
done
sed -e 's|.*static int sigWakeup.*|#define sigWakeup (__SIGRTMAX - 2)|' \
    -i jdk/src/solaris/native/java/net/linux_close.c
>jdk/make/gensrc/GensrcX11Wrappers.gmk
mkdir -p build/linux-x86_64-normal-server-release/jdk/gensrc_no_srczip
mkdir -p build/linux-x86_64-normal-server-release/jdk/classes/javax/swing
>build/linux-x86_64-normal-server-release/jdk/classes/javax/swing/SwingBeanInfoBase.class
mkdir -p build/linux-x86_64-normal-server-release/jdk/classes/sun/swing
>build/linux-x86_64-normal-server-release/jdk/classes/sun/swing/BeanInfoUtils.class
find jdk/src/solaris/classes/sun/awt/X11 -type f -name '*.java' -delete
{% endblock %}

{% block make_flags %}
TOOL_AWT_TOBIN=echo
GENSRC_SWING_BEANINFO=
C_FLAG_DEPS="-MMD -MF"
CXX_FLAG_DEPS="-MMD -MF"
{% endblock %}
