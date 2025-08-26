{% extends '//die/c/cmake.sh' %}

# check bin/telegram/desktop

{% block pkg_name %}
abseil-cpp
{% endblock %}

{% block version %}
20250512.1
{% endblock %}

{% block fetch %}
https://github.com/abseil/abseil-cpp/archive/refs/tags/{{self.version().strip()}}.tar.gz
9b7a064305e9fd94d124ffa6cc358592eb42b5da588fb4e07d09254aa40086db
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
