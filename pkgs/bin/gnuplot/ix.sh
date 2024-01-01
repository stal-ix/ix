{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/gnuplot/gnuplot/6.0.0/gnuplot-6.0.0.tar.gz
sha:635a28f0993f6ab0d1179e072ad39b8139d07f51237f841d93c6c2ff4b1758ec
{% endblock %}

{% block bld_libs %}
lib/c
lib/gd
lib/cerf
lib/glib
lib/cairo
lib/pango
lib/readline
{% endblock %}

{% block bld_tool %}
bin/iconv
bld/fakegit
{% endblock %}

{% block configure_flags %}
--with-gd
--with-qt=no
--disable-plugins
--with-bitmap-terminals
{% endblock %}

{% block patch %}
cat << EOF > docs/term.h
#include "../src/term.h"
EOF
{% endblock %}
