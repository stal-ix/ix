{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/gnuplot/gnuplot/5.4.7/gnuplot-5.4.7.tar.gz
sha:318a1501c9e659f39cf05ee5268335671bddc6c20eae06851f262fde27c2e739
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
