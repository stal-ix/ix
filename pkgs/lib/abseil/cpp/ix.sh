{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/abseil/abseil-cpp/archive/refs/tags/20230125.1.tar.gz
sha:81311c17599b3712069ded20cca09a62ab0bf2a89dfa16993786c8782b7ed145
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/execinfo
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block patch %}
cat << EOF > absl/base/options.h
{% include 'options.h' %}
EOF
{% endblock %}

{% block setup %}
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
