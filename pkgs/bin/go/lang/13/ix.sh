{% extends '//bin/go/lang/20/ix.sh' %}

{% block version %}
1.13.15
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
7424767d0bf1c9100ba2a124e0550efc5e6c917c8eb1c4d7fb94ba3cbc34397a
{% endblock %}
