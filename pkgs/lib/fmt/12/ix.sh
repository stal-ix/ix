{% extends '//lib/fmt/t/ix.sh' %}

{% block pkg_name %}
fmt
{% endblock %}

{% block version %}
12.2.1
{% endblock %}

{% block fetch %}
https://github.com/fmtlib/fmt/archive/refs/tags/{{self.version().strip()}}.tar.gz
449374d74f31b67796dece454d59b93e6f1538efcce0e9ac78000c98142c139e
{% endblock %}
