{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/google/swiftshader
{% endblock %}

{% block git_commit %}
720189cae8478484f51531a9eed9abc6d8635271
{% endblock %}

{% block git_sha %}
1f2e263d9d2257a5b73a8da51093477db794ee469d4248b2b509212a4b2a96e0
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/wayland
{% endblock %}

{% block bld_libs %}
lib/swift/shader/shim
{% endblock %}

{% block cmake_flags %}
SWIFTSHADER_BUILD_WSI_XCB=OFF
SWIFTSHADER_BUILD_TESTS=OFF
SWIFTSHADER_WARNINGS_AS_ERRORS=OFF
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp ${tmp}/lib/libvk_swiftshader.a ${out}/lib/
{% endblock %}

{% block env %}
export SWIFTSHADER_LIB=${out}/lib/libvk_swiftshader.a
{% endblock %}
