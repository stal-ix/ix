{% extends '//bin/go/lang/20/ix.sh' %}

{% block fetch %}
https://github.com/golang/go/archive/refs/tags/go1.22.1.tar.gz
sha:e6dbc2e591b577ef7d3cb0f6572568521c2dcfe8c7521f1253fe23fd624cdc56
{% endblock %}

{% block go_bootstrap %}
bin/go/lang/21
{% endblock %}
