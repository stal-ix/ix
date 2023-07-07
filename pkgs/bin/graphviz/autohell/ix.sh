{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.com/graphviz/graphviz/-/archive/8.1.0/graphviz-8.1.0.tar.bz2
sha:ce8911695752aa2c3929147e3dee016e58aa624d81d7c18dd16f895ae79460de
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
