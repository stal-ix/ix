{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/AcademySoftwareFoundation/openexr/archive/refs/tags/v3.1.5.tar.gz
sha:93925805c1fc4f8162b35f0ae109c4a75344e6decae5a240afdfce25f8a433ec
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/imath
{% endblock %}

{% block cmake_flags %}
OPENEXR_INSTALL_EXAMPLES=OFF
{% endblock %}

{% block setup %}
export CMAKE_PREFIX_PATH="${lib_imath}"
{% endblock %}
