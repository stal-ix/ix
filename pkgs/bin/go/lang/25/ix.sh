{% extends '//bin/go/lang/22/ix.sh' %}

{% block version %}
1.25.2
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
301f8d65edb32ab2080fbe80b559a6369c0e3f792d2b0d1078a2764f8b579bcb
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/23
{% endblock %}
