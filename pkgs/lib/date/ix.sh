{% extends '//die/c/cmake.sh' %}

{% block version %}3.0.1{% endblock %}

{% block fetch %}
https://github.com/HowardHinnant/date/archive/refs/tags/v{{self.version()}}.tar.gz
sha:7a390f200f0ccd207e8cff6757e04817c1a0aec3e327b006b7eb451c57ee3538
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/scripts/genpc
{% endblock %}

{% block cmake_flags %}
ENABLE_DATE_TESTING=OFF
BUILD_TZ_LIB=ON
USE_SYSTEM_TZ_DB=ON
{% endblock %}

{% block install %}
{{super()}}
genpc "date" "{{self.version()}}"
{% endblock %}
