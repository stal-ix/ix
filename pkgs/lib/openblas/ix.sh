{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
OpenBLAS
{% endblock %}

{% block version %}
0.3.34
{% endblock %}

{% block fetch %}
https://github.com/OpenMathLib/OpenBLAS/archive/refs/tags/v{{self.version().strip()}}.tar.gz
cd7e129868320cc2d033afa920e31202dfe0b8066a5b66661900ccc0f197dfed
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
