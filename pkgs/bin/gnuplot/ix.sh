{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/gnuplot/gnuplot/5.4.5/gnuplot-5.4.5.tar.gz
sha:66f679115dd30559e110498fc94d926949d4d370b4999a042e724b8e910ee478
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
