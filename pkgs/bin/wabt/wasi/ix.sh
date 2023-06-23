{% extends '//bin/wabt/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/uv
lib/shim/fake(lib_name=uv_a)
{% endblock %}

{% block cmake_flags %}
{{super()}}
WITH_WASI=ON
WITH_EXCEPTIONS=ON
UVWASI_BUILD_TESTS=OFF
FETCHCONTENT_FULLY_DISCONNECTED=ON
FETCHCONTENT_TRY_FIND_PACKAGE_MODE=ALWAYS
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|.*uv_a PRIVATE.*||' -i CMakeLists.txt
sed -e 's|.*add_subdirectory.*||' -i third_party/uvwasi/CMakeLists.txt
{% endblock %}
