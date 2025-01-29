{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://bitbucket.org/multicoreware/x265_git/downloads/x265_4.1.tar.gz
sha:a31699c6a89806b74b0151e5e6a7df65de4b49050482fe5ebf8a4379d7af8f29
{% endblock %}

{% block unpack %}
{{super()}}
cd source
{% endblock %}

{% block cmake_flags %}
ENABLE_SHARED=OFF
{% if mingw32 %}
ENABLE_ASSEMBLY=OFF
{% elif x86_64 %}
ENABLE_ASSEMBLY=ON
{% else %}
ENABLE_ASSEMBLY=OFF
{% endif %}
{% if mingw32 %}
CMAKE_RC_COMPILER={{target.gnu.three}}-windres
{% endif %}
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_tool %}
{% if x86_64 and not mingw32 %}
bld/nasm
{% endif %}
{% if darwin %}
bld/cctools
{% endif %}
bld/fakegit
{% if mingw32 %}
bld/windres(for_target={{target.gnu.three}})
{% endif %}
{% endblock %}

{% block test %}
test -f ${out}/lib/pkgconfig/x265.pc
{% endblock %}
