{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Martchus/cpp-utilities/archive/refs/tags/v5.17.0.tar.gz
sha:05663fa9ca188cd7be44dc06f1257cfb39b0721443b158a5bbfdaf6400e66505
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
