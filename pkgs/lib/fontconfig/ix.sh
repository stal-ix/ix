{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/fontconfig/{{fontconfig_ver or 'stock'}}
{% endblock %}
