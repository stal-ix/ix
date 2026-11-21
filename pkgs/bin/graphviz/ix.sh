{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
graphviz
{% endblock %}

{% block version %}
16.1.2
{% endblock %}

{% block fetch %}
https://gitlab.com/graphviz/graphviz/-/archive/{{self.version().strip()}}/graphviz-{{self.version().strip()}}.tar.bz2
3b4788642c123657fd1b3e177dc31e4948f6c334dfdaee3ade73927554d7746c
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
