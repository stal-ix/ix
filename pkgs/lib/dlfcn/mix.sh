{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/pg83/dlopen/archive/refs/tags/v1.0.0.tar.gz
sha:af9c658f30ac5d54a0051c0158ae1a2d1ba87ce9155dbec039ec789dc90999b4
{% endblock %}

{% block lib_deps %}
lib/c++
{% endblock %}

{% block std_box %}
bld/bootbox
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/lib/libdl.a ${out}/lib/libdlstub.a
{% endblock %}

{% block patch %}
sed -e 's|-std=c++20|-std=c++17|' -i Makefile
{% endblock %}
