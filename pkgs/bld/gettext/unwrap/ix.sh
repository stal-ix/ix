{% extends '//die/c/autohell.sh' %}

{% block fetch %}
{% include '//lib/intl/gnu/t/ver.sh' %}
{% endblock %}

{% block bld_libs %}
lib/c
lib/shim/gnu
{% endblock %}

{% block bld_tool %}
bld/gzip
bin/gperf
bld/byacc
{% endblock %}

{% block configure_flags %}
--disable-c++
--disable-nls
--disable-curses
--with-included-gettext
{% endblock %}
