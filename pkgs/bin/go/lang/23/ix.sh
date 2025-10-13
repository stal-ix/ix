{% extends '//bin/go/lang/22/ix.sh' %}

{% block version %}
1.23.12
{% endblock %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go{{self.version().strip()}}.tar.gz
0b10c15101a9f219492c4cfcf12b589c2d315075323512e720476a1747434c91
{% endblock %}
