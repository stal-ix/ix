{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
cpp-utilities
{% endblock %}

{% block version %}
5.21.0
{% endblock %}

{% block fetch %}
https://github.com/Martchus/cpp-utilities/archive/refs/tags/v{{self.version().strip()}}.tar.gz
8c94bead63eaa17346438f1ed7df13d58006ae753a39fe21185d48303df1aa27
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
