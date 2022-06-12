{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/Martchus/cpp-utilities/archive/refs/tags/v5.16.0.tar.gz
sha:6bb14ed60e3f84ac53cce4c5a16945d7295f49ee9019a29874a59265db6908c3
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
