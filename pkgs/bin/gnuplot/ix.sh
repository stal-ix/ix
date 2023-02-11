{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/gnuplot/gnuplot/5.4.6/gnuplot-5.4.6.tar.gz
sha:bef7b9618079c724f19d3b0e1d7830b5b407a56b303f2b9e3690a4ce8ce0a89c
{% endblock %}

{% block bld_libs %}
lib/c
lib/gd
lib/cerf
lib/readline
{% endblock %}

{% block configure_flags %}
--with-gd
--disable-plugins
--with-bitmap-terminals
{% endblock %}

{% block patch %}
cat << EOF > docs/term.h
#include "../src/term.h"
EOF
{% endblock %}
