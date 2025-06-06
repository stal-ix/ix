{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
gnuplot
{% endblock %}

{% block version %}
6.0.3
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/gnuplot/gnuplot/{{self.version().strip()}}/gnuplot-{{self.version().strip()}}.tar.gz
sha:2344e78bc78b296f66636a5d9e561b709b61d360185b718583c97a329f7ace5e
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
