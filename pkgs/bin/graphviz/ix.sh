{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.com/graphviz/graphviz/-/archive/12.1.0/graphviz-12.1.0.tar.bz2
sha:ad2023c23935397d4b5a34c14682f8098d2f20d2144c63d20d05be372757fdb1
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
