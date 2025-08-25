{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
abseil-cpp
{% endblock %}

{% block version %}
20250814.0
{% endblock %}

{% block fetch %}
https://github.com/abseil/abseil-cpp/archive/refs/tags/{{self.version().strip()}}.tar.gz
9b2b72d4e8367c0b843fa2bcfa2b08debbe3cee34f7aaa27de55a6cbb3e843db
{% endblock %}

{% block lib_deps %}
lib/c/naked
lib/c++/dispatch
{% if darwin %}
lib/darwin/framework/CoreFoundation
{% endif %}
{% if mingw32 %}
lib/shim/dll(dll_name=advapi32)
lib/shim/dll(dll_name=dbghelp)
{% endif %}
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block patch %}
cat << EOF > absl/base/options.h
{% include 'options.h' %}
EOF
sed -e 's|APPLE AND CMAKE|APPLE_XXX AND CMAKE|' \
    -i absl/copts/AbseilConfigureCopts.cmake
{% endblock %}

{% block setup_target_flags %}
export CXXFLAGS="-std=c++20 ${CXXFLAGS}"
{% endblock %}

{% block cmake_flags %}
CMAKE_CXX_STANDARD=20
# we propagate it ourselves
ABSL_PROPAGATE_CXX_STD=OFF
{% endblock %}
