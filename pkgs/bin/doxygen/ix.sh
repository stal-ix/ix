{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/doxygen/doxygen/archive/refs/tags/Release_1_10_0.tar.gz
sha:795692a53136ca9bb9a6cd72656968af7858a78be7d6d011e12ab1dce6b9533c
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

{% block cmake_flags %}
CORESERVICES_LIB=
use_sys_spdlog=ON
use_sys_sqlite3=ON
{% if mingw32 %}
CMAKE_RC_COMPILER={{target.gnu.three}}-windres
{% endif %}
{% endblock %}
