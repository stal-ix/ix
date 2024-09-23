{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Martchus/cpp-utilities/archive/refs/tags/v5.21.0.tar.gz
sha:8c94bead63eaa17346438f1ed7df13d58006ae753a39fe21185d48303df1aa27
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
