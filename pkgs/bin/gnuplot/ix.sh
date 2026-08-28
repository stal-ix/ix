{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
gnuplot
{% endblock %}

{% block version %}
6.0.5
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/gnuplot/gnuplot/{{self.version().strip()}}/gnuplot-{{self.version().strip()}}.tar.gz
73237f37f03306d68bfae133a9a50d5e9341384e198d5ab37eeca9ab534deed8
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
