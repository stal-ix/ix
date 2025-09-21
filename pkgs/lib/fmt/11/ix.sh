{% extends '//lib/fmt/t/ix.sh' %}

{% block pkg_name %}
fmt
{% endblock %}

{% block version %}
12.0.0
{% endblock %}

{% block fetch %}
https://github.com/fmtlib/fmt/archive/refs/tags/{{self.version().strip()}}.tar.gz
aa3e8fbb6a0066c03454434add1f1fc23299e85758ceec0d7d2d974431481e40
{% endblock %}
