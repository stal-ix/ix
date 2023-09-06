{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/gnuplot/gnuplot/5.4.9/gnuplot-5.4.9.tar.gz
sha:a328a021f53dc05459be6066020e9a71e8eab6255d3381e22696120d465c6a97
{% endblock %}

{% block bld_libs %}
lib/c
lib/gd
lib/cerf
lib/readline
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
