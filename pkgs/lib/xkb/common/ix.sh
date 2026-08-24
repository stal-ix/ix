{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/xkb/common/{{'stalix' if stalix else 'default'}}
{% endblock %}
