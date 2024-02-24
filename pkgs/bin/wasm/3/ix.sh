{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/wasm3/wasm3
{% endblock %}

{% block git_commit %}
772f8f4648fcba75f77f894a6050db121e7651a2
{% endblock %}

{% block git_sha %}
206b21a9071d703a09a6eb808f7dfe7261ff985e0a1e6232d4d6c598d108ec15
{% endblock %}

{% block git_version %}
v2
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
