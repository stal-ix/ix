{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
cpuinfo
{% endblock %}

{% block version %}
2025.02.11
{% endblock %}

{% block fetch %}
https://github.com/pytorch/cpuinfo/archive/{{self.version().strip()}}.zip
sha:1111111111111111111111111111111111111111111111111111111111111111
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
CPUINFO_BUILD_TOOLS=OFF
CPUINFO_BUILD_UNIT_TESTS=OFF
CPUINFO_BUILD_MOCK_TESTS=OFF
CPUINFO_BUILD_BENCHMARKS=OFF
CPUINFO_BUILD_PKG_CONFIG=ON
USE_SYSTEM_LIBS=ON
USE_SYSTEM_GOOGLEBENCHMARK=ON
USE_SYSTEM_GOOGLETEST=ON
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export CMAKE_PREFIX_PATH="${out}:\${CMAKE_PREFIX_PATH}"
{% endblock %}
