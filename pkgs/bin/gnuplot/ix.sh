{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/gnuplot/gnuplot/5.4.8/gnuplot-5.4.8.tar.gz
sha:931279c7caad1aff7d46cb4766f1ff41c26d9be9daf0bcf0c79deeee3d91f5cf
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
