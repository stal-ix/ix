{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
OpenBLAS
{% endblock %}

{% block version %}
0.3.30
{% endblock %}

{% block fetch %}
https://github.com/OpenMathLib/OpenBLAS/archive/refs/tags/v{{self.version().strip()}}.tar.gz
27342cff518646afb4c2b976d809102e368957974c250a25ccc965e53063c95d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
NO_AFFINITY=ON
USE_OPENMP=0
NO_WARMUP=1
TARGET=CORE2
NUM_THREADS=64
DYNAMIC_ARCH=ON
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/openblas \${CPPFLAGS}"
{% endblock %}
