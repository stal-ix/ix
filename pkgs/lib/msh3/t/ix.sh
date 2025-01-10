{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/nibanks/msh3/archive/refs/tags/v0.8.0.tar.gz
sha:a99e5c513db3824d16ac188ae64fbdf6ae45d256ebfbeddb895d5d815ef5e644
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/msquic
lib/qpack/ls
{% endblock %}

{% block bld_libs %}
lib/bsd/overlay
{% endblock %}

{% block cpp_includes %}
${PWD}
{% endblock %}

{% block setup_target_flags %}
export CXXFLAGS="-std=c++20 ${CXXFLAGS}"
{% endblock %}

{% block cmake_flags %}
MSH3_USE_EXTERNAL_MSQUIC=ON
MSH3_USE_EXTERNAL_LSQPACK=ON
{% endblock %}
