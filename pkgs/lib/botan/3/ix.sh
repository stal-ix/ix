{% extends '//lib/botan/ix.sh' %}

{% block pkg_name %}
botan
{% endblock %}

{% block version %}
3.13.0
{% endblock %}

{% block fetch %}
https://github.com/randombit/botan/archive/refs/tags/{{self.version().strip()}}.tar.gz
9fbff1cd4fe7caff9bc146304dabf551e05a8beefdf03062b63d02cbb61f2e22
{% endblock %}
