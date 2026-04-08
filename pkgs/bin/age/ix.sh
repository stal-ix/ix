{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/age/encrypt
bin/age/keygen
{% endblock %}
