{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/gnuplot/gnuplot/5.4.4/gnuplot-5.4.4.tar.gz
sha:372300b7867f5b3538b25fc5d0ac7734af6e3fe0d202b6db926e4369913f0902
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
