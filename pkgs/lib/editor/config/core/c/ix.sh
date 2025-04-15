{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
editorconfig-core-c
{% endblock %}

{% block version %}
0.12.9
{% endblock %}

{% block fetch %}
https://github.com/editorconfig/editorconfig-core-c/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:4aaa4e3883332aac7ec19c169dcf128f5f0f963f61d09beb299eb2bce5944e2c
{% endblock %}

{% block lib_deps %}
lib/c
lib/pcre/2
{% endblock %}
