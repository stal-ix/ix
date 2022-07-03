{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/convert
bin/catimg/unwrap
{% endblock %}
