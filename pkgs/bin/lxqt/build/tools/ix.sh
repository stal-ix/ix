{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/lxqt/lxqt-build-tools/archive/refs/tags/2.0.0.tar.gz
sha:d433ce4de6e69d72de7692424dc5f6bed492c09130a8a59bcd63b20f4d88d328
{% endblock %}

{% block bld_libs %}
lib/qt/6/base
{% endblock %}

{% block bld_tool %}
bld/qt/6
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*set.*LXQT.*tools/share.*||' \
    -i ${out}/share/cmake/lxqt2-build-tools/modules/LXQtConfigVars.cmake
{% endblock %}
