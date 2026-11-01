{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
sysklogd
{% endblock %}

{% block version %}
2.8.0
{% endblock %}

{% block fetch %}
https://github.com/troglobit/sysklogd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b79a17c2ef993e68d5629455bb42b171e925b1a79517be917f9fedb6cb5d756e
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
