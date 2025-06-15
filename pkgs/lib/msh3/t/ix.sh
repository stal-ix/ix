{% extends '//die/c/cmake.sh' %}

# check bin/curl/ms

{% block pkg_name %}
msh3
{% endblock %}

{% block version %}
0.8.1
{% endblock %}

{% block fetch %}
https://github.com/nibanks/msh3/archive/refs/tags/v{{self.version().strip()}}.tar.gz
80087dab9a22253c224aaee5bef8c870519dc0a362b9c9bb60e9aca8bec5e1c4
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

{% block setup_target_flags %}
export CXXFLAGS="-std=c++20 ${CXXFLAGS}"
{% endblock %}

{% block cmake_flags %}
MSH3_USE_EXTERNAL_MSQUIC=ON
MSH3_USE_EXTERNAL_LSQPACK=ON
{% endblock %}
