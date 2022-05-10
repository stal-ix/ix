{% extends '//mix/hub.sh' %}

{% block lib_deps %}
lib/fmt/{{fmt_ver or '8'}}
{% endblock %}
