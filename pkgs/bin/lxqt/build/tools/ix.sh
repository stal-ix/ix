{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
lxqt-build-tools
{% endblock %}

{% block version %}
2.2.0
{% endblock %}

{% block fetch %}
https://github.com/lxqt/lxqt-build-tools/archive/refs/tags/{{self.version().strip()}}.tar.gz
ecee3248c9435580e9eec844d8b2a989bbf1472cc292a04bc4f8708127fea1c5
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
