{% extends 'cmake.sh' %}

{% block std_box %}
bld/perl
{{super()}}
{% endblock %}

{% block cmake_flags %}
INSTALL_LIBEXECDIR=bin
INSTALL_MKSPECSDIR=lib/mkspecs
{% endblock %}

{% block postinstall %}
find ${out}/plugins/ -type f -name '*.a' | while read l; do
    cp ${l} ${out}/lib/
done
{% endblock %}
