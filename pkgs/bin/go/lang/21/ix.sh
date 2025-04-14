{% extends '//bin/go/lang/20/ix.sh' %}

{% block version %}
1.21.13
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
sha:9614298b9f59a5ed9de6265e2508947ecb7f396de4284e0d9a094f2efd53b806
{% endblock %}
