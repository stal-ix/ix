{% extends '//die/c/make.sh' %}

{% block pkg_name %}
git
{% endblock %}

{% block version %}
2.51.1
{% endblock %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v{{self.version().strip()}}.tar.gz
586fc2c8ba466c1f2122d44047e5fb575a5c0a7620840d3ab5f6943fc281c8c4
{% endblock %}
