{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
gl4es
{% endblock %}

{% block version %}
1.1.4
{% endblock %}

{% block fetch %}
https://github.com/ptitSeb/gl4es/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b565e717c7d192e936bda25f3cb90ad8db398af56414ec08294b6716574c1a6d
{% endblock %}

{% block lib_deps %}
lib/c
lib/opengl
lib/execinfo
{% endblock %}

{% block cmake_flags %}
STATICLIB=ON
NOX11=ON
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block install %}
cp -R lib ${out}
{% endblock %}
