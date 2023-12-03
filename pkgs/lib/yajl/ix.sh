{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/lloyd/yajl/archive/refs/tags/2.1.0.tar.gz
md5:6887e0ed7479d2549761a4d284d3ecb0
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
