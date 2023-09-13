{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/fmt/{{libfmt_ver or '10'}}
{% endblock %}
