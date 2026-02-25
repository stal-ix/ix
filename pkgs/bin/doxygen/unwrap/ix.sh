{% extends '//die/c/cmake.sh' %}

{% block version %}
1.16.1
{% endblock %}

{% block pkg_name %}
doxygen
{% endblock %}

{% block fetch %}
https://github.com/doxygen/doxygen/archive/refs/tags/Release_{{self.version().strip().replace('.', '_')}}.tar.gz
cdf9d614ee8ed6a939ad12ab31a6aaa1b0c089dff2a4ce20aa008893b686d636
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
-std=c++20
{% endblock %}

{% block cmake_flags %}
CORESERVICES_LIB=
use_sys_spdlog=ON
use_sys_sqlite3=ON
{% if mingw32 %}
CMAKE_RC_COMPILER={{target.gnu.three}}-windres
{% endif %}
{% endblock %}
