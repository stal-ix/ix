{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
graphviz
{% endblock %}

{% block version %}
12.2.1
{% endblock %}

{% block fetch %}
https://gitlab.com/graphviz/graphviz/-/archive/{{self.version().strip()}}/graphviz-{{self.version().strip()}}.tar.bz2
sha:a990b38c3ea807a06597ce8d46d87878e59bb3fb12609fd98c02a861a4ca81b8
{% endblock %}

{% block make_no_thrs %}
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/gd
lib/expat
lib/freetype
lib/fontconfig
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/python
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin
mv dot_static dot
rm *_static
{% endblock %}
