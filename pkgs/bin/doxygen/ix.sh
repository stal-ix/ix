{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/doxygen/doxygen/archive/refs/tags/Release_1_13_2.tar.gz
sha:4c9d9c8e95c2af4163ee92bcb0f3af03b2a4089402a353e4715771e8d3701c48
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/iconv
lib/spdlog
lib/sqlite/3
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/python
{% if mingw32 %}
bld/windres(for_target={{target.gnu.three}})
{% endif %}
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cxx_flags %}
-Wno-missing-template-arg-list-after-template-kw
{% endblock %}

{% block cmake_flags %}
CORESERVICES_LIB=
use_sys_spdlog=ON
use_sys_sqlite3=ON
{% if mingw32 %}
CMAKE_RC_COMPILER={{target.gnu.three}}-windres
{% endif %}
{% endblock %}
