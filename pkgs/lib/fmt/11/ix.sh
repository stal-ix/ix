{% extends '//lib/fmt/t/ix.sh' %}

{% block version %}
11.1.4
{% endblock %}

{% block fetch %}
https://github.com/fmtlib/fmt/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:ac366b7b4c2e9f0dde63a59b3feb5ee59b67974b14ee5dc9ea8ad78aa2c1ee1e
{% endblock %}
