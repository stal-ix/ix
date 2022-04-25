{% extends 'cmake.sh' %}

{% block std_box %}
{% block qt_codegen %}
bld/qt
bld/perl
{% endblock %}
{{super()}}
{% endblock %}

{% block cmake_flags %}
QT_BUILD_EXAMPLES=OFF
QT_BUILD_TESTS=OFF
INSTALL_LIBEXECDIR=bin
{% block qt_cross_flags %}
QT_FORCE_FIND_TOOLS=ON
QT_WILL_BUILD_TOOLS=OFF
QT_BUILD_TOOLS_WHEN_CROSSCOMPILING=OFF
QT_FEATURE_cross_compile=ON
{% endblock %}
{% endblock %}

{% block postinstall %}
find ${out}/plugins/ -type f -name '*.a' | while read l; do
    cp ${l} ${out}/lib/
done
{% endblock %}
