{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
gnuplot
{% endblock %}

{% block version %}
6.0.6
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/gnuplot/gnuplot/{{self.version().strip()}}/gnuplot-{{self.version().strip()}}.tar.gz
9d39d8499c9533550144092375aac45ba8bf0c18c9cee50897fe411b6d93004e
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
