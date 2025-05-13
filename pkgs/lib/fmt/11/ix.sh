{% extends '//lib/fmt/t/ix.sh' %}

{% block pkg_name %}
fmt
{% endblock %}

{% block version %}
11.2.0
{% endblock %}

{% block fetch %}
https://github.com/fmtlib/fmt/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:bc23066d87ab3168f27cef3e97d545fa63314f5c79df5ea444d41d56f962c6af
{% endblock %}
