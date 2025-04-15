{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
gnuplot
{% endblock %}

{% block version %}
6.0.2
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/gnuplot/gnuplot/{{self.version().strip()}}/gnuplot-{{self.version().strip()}}.tar.gz
sha:f68a3b0bbb7bbbb437649674106d94522c00bf2f285cce0c19c3180b1ee7e738
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
