{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/binutils/binutils-2.37.tar.xz
e78d9ff2976b745a348f4c1f27c77cb1
{% endblock %}

{% block bld_libs %}
lib/z
lib/c
lib/c++
lib/intl
{% endblock %}

{% block bld_tool %}
bin/flex
bin/bison/3/6
{% endblock %}

{% block configure_flags %}
--disable-werror
--disable-plugins
--with-system-zlib
--disable-multilib
--enable-deterministic-archives
{% endblock %}

{% block setup %}
export CPPFLAGS="-w ${CPPFLAGS}"
export acx_cv_cc_gcc_supports_ada=no
{% endblock %}
