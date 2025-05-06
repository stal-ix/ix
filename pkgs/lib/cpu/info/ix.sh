{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
cpuinfo
{% endblock %}

{% block version %}
5e3d2445e6a84d9599bee2bf78edbb4d80865e1d
{% endblock %}

{% block fetch %}
https://github.com/pytorch/cpuinfo/archive/{{self.version().strip()}}.zip
sha:f335b437ef06ddc8916129d3baf423e986d70dd31aa2b8b8a752c36bcfa040a2
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
