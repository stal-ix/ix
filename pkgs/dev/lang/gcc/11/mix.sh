{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
http://mirror.koddos.net/gcc/releases/gcc-11.2.0/gcc-11.2.0.tar.xz
31c86f2ced76acac66992eeedce2fce2
{% endblock %}

{% block bld_libs %}
lib/z/mix.sh
lib/c++/mix.sh
lib/isl/mix.sh
lib/gmp/mix.sh
lib/mpc/mix.sh
lib/intl/mix.sh
lib/mpfr/mix.sh
{% endblock %}

{% block bld_tool %}
dev/lang/flex/mix.sh
dev/doc/texinfo/mix.sh
dev/lang/bison/3/8/mix.sh
{% endblock %}

{% block configure_flags %}
--with-system-zlib

--disable-libstdcxx
--disable-multilib
--disable-bootstrap

--enable-serial-host
--enable-serial-target
--enable-serial-build

--enable-languages=c,c++

--with-static-standard-libraries=yes
{% endblock %}

{% block make_verbose %}
{% endblock %}

{% block setup %}
export CPPFLAGS="-w ${CPPFLAGS}"
export acx_cv_cc_gcc_supports_ada=no
{% endblock %}
