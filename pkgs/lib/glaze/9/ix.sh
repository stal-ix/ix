{% extends '//lib/glaze/ix.sh' %}

# noauto

{% block version %}
9.1.0
{% endblock %}

{% block fetch %}
https://github.com/stephenberry/glaze/archive/refs/tags/v{{self.version().strip()}}.tar.gz
55f8a675397c505f9bee6c160e1c26b0085868f185d04d7a7727531fdbff4bd4
{% endblock %}
