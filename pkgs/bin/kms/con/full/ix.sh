{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/kms/con(kmscon_pretty=1,kmscon_fast=1)
{% endblock %}
