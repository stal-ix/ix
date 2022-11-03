{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Martchus/cpp-utilities/archive/refs/tags/v5.20.0.tar.gz
sha:0aeebdaab93ebdb70f5e77f008e229db765da8575989842dbe4cbe20f3dc08e7
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
