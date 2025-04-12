{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
lxqt-build-tools
{% endblock %}

{% block version %}
2.1.0
{% endblock %}

{% block fetch %}
https://github.com/lxqt/lxqt-build-tools/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:f24679bd4f50900981cf614c1341b6fbcf81d8ab3dbccae435f7ee878fc1b060
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
