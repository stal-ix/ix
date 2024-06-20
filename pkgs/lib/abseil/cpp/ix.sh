{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/abseil/abseil-cpp/archive/refs/tags/20230802.1.tar.gz
sha:987ce98f02eefbaf930d6e38ab16aa05737234d7afbab2d5c4ea7adbe50c28ed
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/execinfo
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

{% block env %}
export CXXFLAGS="-std=c++20 \${CXXFLAGS}"
{% endblock %}

{% block cmake_flags %}
CMAKE_CXX_STANDARD=20
# we propagate it ourselves
ABSL_PROPAGATE_CXX_STD=OFF
{% endblock %}
