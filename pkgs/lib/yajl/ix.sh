{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
yajl
{% endblock %}

{% block version %}
2.1.0
{% endblock %}

{% block fetch %}
https://github.com/lloyd/yajl/archive/refs/tags/{{self.version().strip()}}.tar.gz
3fb73364a5a30efe615046d07e6db9d09fd2b41c763c5f7d3bfb121cd5c5ac5a
{% endblock %}

{% block cmake_flags %}
{% if mingw32 %}
CMAKE_SYSTEM_NAME=MSYS
{% endif %}
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/lib/libyajl_s.a
mv ${out}/share/pkgconfig ${out}/lib/
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
