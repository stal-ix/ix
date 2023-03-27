{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.com/graphviz/graphviz/-/archive/8.0.1/graphviz-8.0.1.tar.bz2
sha:7d05d4dc919e0d28b06ddbfec2525d4fe8a38521435ea4a05cf9649e09206f68
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
