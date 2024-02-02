{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/wasm3/wasm3
{% endblock %}

{% block git_commit %}
772f8f4648fcba75f77f894a6050db121e7651a2
{% endblock %}

{% block git_sha %}
0eb25e22f2fa9ba9e563c2a96feed6890d96a01f11cb549facbe0f432d0e8bda
{% endblock %}

{% block git_refine %}
find . -type l -delete
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
