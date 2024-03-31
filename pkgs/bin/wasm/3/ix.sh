{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/wasm3/wasm3
{% endblock %}

{% block git_commit %}
772f8f4648fcba75f77f894a6050db121e7651a2
{% endblock %}

{% block git_sha %}
6f4a81f6d62818a68e7d96d69a98e4f937bccc2e0a7b8af68be9dbf9fe05e9ad
{% endblock %}

{% block git_version %}
v3
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
