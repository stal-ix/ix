{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
x265
{% endblock %}

{% block version %}
4.3
{% endblock %}

{% block fetch %}
https://github.com/Multicorewareinc/x265/archive/refs/tags/{{self.version().strip()}}.tar.gz
fb157f809b74dabbef5002af99489fcaebb4d0073724beffdaaf2be15cbaf7ac
{% endblock %}

{% block unpack %}
{{super()}}
cd source
{% endblock %}

{% block patch %}
sed -e 's|SET CMP0025 OLD|SET CMP0025 NEW|' \
    -e 's|SET CMP0054 OLD|SET CMP0054 NEW|' \
    -i CMakeLists.txt
{% endblock %}

{% block cmake_flags %}
CMAKE_POLICY_VERSION_MINIMUM=3.5
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
