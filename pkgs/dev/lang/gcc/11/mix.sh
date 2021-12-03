{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
http://mirror.koddos.net/gcc/releases/gcc-11.2.0/gcc-11.2.0.tar.xz
31c86f2ced76acac66992eeedce2fce2
{% endblock %}

{% block bld_libs %}
lib/gmp/mix.sh
lib/mpc/mix.sh
lib/mpfr/mix.sh
{% endblock %}

{% block bld_tool %}
dev/lang/flex/mix.sh
dev/lang/bison/3/8/mix.sh
{% endblock %}

{% block coflags %}
--disable-multilib
--enable-languages=c,c++
--with-static-standard-libraries=yes
{% endblock %}

{% block setup %}
export acx_cv_cc_gcc_supports_ada=no
{% endblock %}
