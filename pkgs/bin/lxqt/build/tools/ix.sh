{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
lxqt-build-tools
{% endblock %}

{% block version %}
2.3.0
{% endblock %}

{% block fetch %}
https://github.com/lxqt/lxqt-build-tools/archive/refs/tags/{{self.version().strip()}}.tar.gz
ec4e890d3bfa4c249179d5eb70e5e2f9adc73f6a86e5f79be0c7c1ca0661a593
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
