{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/kitty/prev/{{target.os}}
{% endblock %}
