{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/wasm3/wasm3
{% endblock %}

{% block git_commit %}
772f8f4648fcba75f77f894a6050db121e7651a2
{% endblock %}

{% block git_sha %}
e8aaaf4405ff5e6efdd312c70da40a537af27576c2859f9f41aa8a99d019e5d0
{% endblock %}

{% block bld_libs %}
lib/c
lib/wasi/uv
lib/shim/fake(lib_name=uv_a)
{% endblock %}

{% block cmake_flags %}
FETCHCONTENT_FULLY_DISCONNECTED=ON
FETCHCONTENT_TRY_FIND_PACKAGE_MODE=ALWAYS
{% endblock %}

{% block patch %}
sed -e 's|.*add_subdirectory.*uvwasi_SOURCE_DIR.*||' -i CMakeLists.txt
{% endblock %}
