{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
graphviz
{% endblock %}

{% block version %}
13.0.1
{% endblock %}

{% block fetch %}
https://gitlab.com/graphviz/graphviz/-/archive/{{self.version().strip()}}/graphviz-{{self.version().strip()}}.tar.bz2
bbc0b751d4d57c1ec07e681773f63c08baba037cc83236a126ab34a632ddb685
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
