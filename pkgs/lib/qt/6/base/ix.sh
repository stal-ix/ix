{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/qt/6/base/{{libqt6_ver or 'gui'}}
{% endblock %}
