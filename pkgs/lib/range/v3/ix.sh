{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ericniebler/range-v3/archive/refs/tags/0.12.0.tar.gz
sha:015adb2300a98edfceaf0725beec3337f542af4915cec4d0b89fa0886f4ba9cb
#https://github.com/ericniebler/range-v3/archive/4624c63972c6f2c2871c7b87813c42048ddb80ad.tar.gz
#sha:05f9a55ac7573875fe4dd6dc5ece6753743501f13383f9f8caf8911246427957
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
RANGE_V3_DOCS=OFF
RANGE_V3_TESTS=OFF
RANGE_V3_EXAMPLES=OFF
RANGE_V3_PERF=OFF
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block env1 %}
export CPPFLAGS="-DCPP_CXX_CONCEPTS=0L \${CPPFLAGS}"
{% endblock %}
