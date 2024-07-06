{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/icu/{{libicu_ver or 'archive'}}
{% endblock %}
