{% extends '//bin/ya/t/t/ix.sh' %}

{% block fetch %}
https://github.com/pg83/yaboot/archive/refs/tags/2.tar.gz
4b4643c5bd940a8e451d75cb9f401c8f59fed6c9d608f1692d0656a49cf09741
{% endblock %}

{% block step_unpack %}
{{super()}}
extract 1 ${src}/2.tar.gz
{% endblock %}
