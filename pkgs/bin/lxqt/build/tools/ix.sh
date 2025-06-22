{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
lxqt-build-tools
{% endblock %}

{% block version %}
2.2.1
{% endblock %}

{% block fetch %}
https://github.com/lxqt/lxqt-build-tools/archive/refs/tags/{{self.version().strip()}}.tar.gz
a2728eea1fa7096522a2016f1d24f074669984cca470e81db6d1870c7681607a
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/qt/6/base/nogui
{% endblock %}

{% block bld_tool %}
bld/qt/6
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*set.*LXQT.*tools/share.*||' \
    -i ${out}/share/cmake/lxqt2-build-tools/modules/LXQtConfigVars.cmake
{% endblock %}
