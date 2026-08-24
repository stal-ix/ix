{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/fontconfig/{{'stalix' if stalix else 'default'}}
{% endblock %}
