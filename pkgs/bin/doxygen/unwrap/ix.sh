{% extends '//die/c/cmake.sh' %}

{% block version %}
1.14.0
{% endblock %}

{% block pkg_name %}
doxygen
{% endblock %}

{% block fetch %}
https://github.com/doxygen/doxygen/archive/refs/tags/Release_{{self.version().strip().replace('.', '_')}}.tar.gz
sha:5663bf33e979381f470c2f4055c3b162e0abe41bdd6c5dccefd8d8775780bcc3
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
