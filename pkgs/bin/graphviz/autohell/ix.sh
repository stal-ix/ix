{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.com/graphviz/graphviz/-/archive/11.0.0/graphviz-11.0.0.tar.bz2
sha:95173d21922082b0b2649fb24c1dc4bbc1e39504a92903b88df39804778cbb9d
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
