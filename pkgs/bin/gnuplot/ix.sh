{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/gnuplot/gnuplot/5.4.3/gnuplot-5.4.3.tar.gz
sha:51f89bbab90f96d3543f95235368d188eb1e26eda296912256abcd3535bd4d84
{% endblock %}

{% block bld_libs %}
lib/c
lib/gd
lib/readline
{% endblock %}

{% block configure_flags %}
--disable-plugins
--with-gd
--with-bitmap-terminals
{% endblock %}

{% block patch %}
cat << EOF > docs/term.h
#include "../src/term.h"
EOF
{% endblock %}
