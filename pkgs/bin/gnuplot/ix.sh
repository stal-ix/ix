{% extends '//die/c/autorehell.sh' %}

{% block version %}
6.0.1
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/gnuplot/gnuplot/{{self.version().strip()}}/gnuplot-{{self.version().strip()}}.tar.gz
sha:e85a660c1a2a1808ff24f7e69981ffcbac66a45c9dcf711b65610b26ea71379a
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
