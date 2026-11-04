{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
lxqt-build-tools
{% endblock %}

{% block version %}
2.5.0
{% endblock %}

{% block fetch %}
https://github.com/lxqt/lxqt-build-tools/archive/refs/tags/{{self.version().strip()}}.tar.gz
77dec4deef59576c00230df8d0adabdd598f8df4fc7007a895a5e10ad3208e81
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
