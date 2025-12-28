{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
graphviz
{% endblock %}

{% block version %}
14.1.1
{% endblock %}

{% block fetch %}
https://gitlab.com/graphviz/graphviz/-/archive/{{self.version().strip()}}/graphviz-{{self.version().strip()}}.tar.bz2
975f4b9a7a7a7b614900ecd12919ccbd36a680818cc6fc527389b93e919410f0
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
