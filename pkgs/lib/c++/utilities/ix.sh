{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Martchus/cpp-utilities/archive/refs/tags/v5.19.0.tar.gz
sha:845362bd91d3e1ecb6bf3fc18492dda1d48458f35380dd79351ea7bb36804be0
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/boost
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mkdir -p lib/cmake
ln -s share/c++utilities/cmake lib/cmake/c++utilities
{% endblock %}

{% block postinstall %}
:
{% endblock %}
