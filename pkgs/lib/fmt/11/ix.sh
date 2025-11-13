{% extends '//lib/fmt/t/ix.sh' %}

{% block pkg_name %}
fmt
{% endblock %}

{% block version %}
12.1.0
{% endblock %}

{% block fetch %}
https://github.com/fmtlib/fmt/archive/refs/tags/{{self.version().strip()}}.tar.gz
ea7de4299689e12b6dddd392f9896f08fb0777ac7168897a244a6d6085043fea
{% endblock %}
