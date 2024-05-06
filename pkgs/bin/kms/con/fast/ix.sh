{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/kms/con(kmscon_fast=1)
{% endblock %}
