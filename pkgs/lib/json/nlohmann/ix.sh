{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/json/nlohmann/{{libnlohmann_json_ver or '11'}}
{% endblock %}
