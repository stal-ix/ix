{% extends '//lib/fmt/t/ix.sh' %}

{% block pkg_name %}
fmt
{% endblock %}

{% block version %}
10.2.1
{% endblock %}

{% block fetch %}
https://github.com/fmtlib/fmt/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:1250e4cc58bf06ee631567523f48848dc4596133e163f02615c97f78bab6c811
{% endblock %}
