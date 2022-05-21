{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/kitty/{{target.os}}
{% endblock %}
