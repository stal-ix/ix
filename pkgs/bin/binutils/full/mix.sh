{% extends '//bin/binutils/t/mix.sh' %}

{% block bld_libs %}
lib/z
lib/c
lib/c++
lib/intl
{% endblock %}

{% block bld_tool %}
bld/flex
bld/perl
bld/texinfo
bin/bison/3/6
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-system-zlib
--disable-multilib
--enable-deterministic-archives
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block setup %}
export acx_cv_cc_gcc_supports_ada=no
{% endblock %}
