{% extends '//die/c/configure.sh' %}

{% block fetch %}
https://openjdk-sources.osci.io/openjdk11/openjdk-11.0.22-ga.tar.xz
e310b1a8343ffb857240ba97ea95f1319781d2d5614de99fc499f674bd268aa1
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block bld_tool %}
bin/zip
bin/gzip
bld/bash
bld/auto
bin/unzip
bld/java/8
bld/devendor
{% endblock %}

{% block build %}
unset CLASSPATH
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

{% block cpp_defines1 %}
isnanf=isnan
CLONE_VM=0
CLONE_VFORK=0
SIGCLD=SIGCHLD
__SIGRTMAX=SIGRTMAX
HAS_GLIBC_GETHOSTBY_R=1
{% endblock %}

{% block c_flags1 %}
-Wno-implicit-function-declaration
{% endblock %}

{% block cxx_flags %}
-std=c++98
{% endblock %}

{% block make_no_thrs %}
{% endblock %}

{% block configure_flags %}
--disable-option-checking
--with-toolchain-type=clang
--with-jvm-variants=zero
--disable-headful
--without-x
--with-boot-jdk=${JAVA_HOME}
{% endblock %}
