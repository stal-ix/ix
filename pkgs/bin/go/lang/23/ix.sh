{% extends '//bin/go/lang/22/ix.sh' %}

{% block version %}
1.23.6
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
06ca9da2305302a7ca1593afadf012494debf658a11e4e41119ee1ee160f77c7
{% endblock %}
