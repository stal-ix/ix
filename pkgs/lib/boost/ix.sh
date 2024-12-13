{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/boost/{{libboost_ver or '87'}}
{% endblock %}
