{% extends '//die/c/make.sh' %}

{% block pkg_name %}
git
{% endblock %}

{% block version %}
2.51.2
{% endblock %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v{{self.version().strip()}}.tar.gz
024e03605148682cf36fc7eade98405f4448e44532e1e65bd653c2ad2a59e0f7
{% endblock %}
