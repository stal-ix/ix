{% extends '//lib/fmt/t/ix.sh' %}

{% block pkg_name %}
fmt
{% endblock %}

{% block version %}
12.2.0
{% endblock %}

{% block fetch %}
https://github.com/fmtlib/fmt/archive/refs/tags/{{self.version().strip()}}.tar.gz
8b852bb5aa6e7d8564f9e81394055395dd1d1936d38dfd3a17792a02bebd7af0
{% endblock %}
