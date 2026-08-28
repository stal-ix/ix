{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
graphviz
{% endblock %}

{% block version %}
16.0.0
{% endblock %}

{% block fetch %}
https://gitlab.com/graphviz/graphviz/-/archive/{{self.version().strip()}}/graphviz-{{self.version().strip()}}.tar.bz2
f55f0b24afcfaa94f9c7d5fff7c5ddbce9f738fb7aa9453761aca09f61b23625
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
