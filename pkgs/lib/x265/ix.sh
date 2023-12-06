{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://bitbucket.org/multicoreware/x265_git/downloads/x265_3.5.tar.gz
sha:e70a3335cacacbba0b3a20ec6fecd6783932288ebc8163ad74bcc9606477cae8
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
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_tool %}
{% if x86_64 and not mingw32 %}
bin/nasm
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
