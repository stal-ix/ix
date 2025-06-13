{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
tomlplusplus
{% endblock %}

{% block version %}
3.4.0
{% endblock %}

{% block fetch %}
https://github.com/marzer/tomlplusplus/archive/refs/tags/v{{self.version().strip()}}.tar.gz
8517f65938a4faae9ccf8ebb36631a38c1cadfb5efa85d9a72e15b9e97d25155
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/shim/fake/pkg(pkg_name=tomlplusplus,pkg_ver=3.4.0)
{% endblock %}
