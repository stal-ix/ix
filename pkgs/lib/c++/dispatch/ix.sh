{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/c++/{{libcplpl_ver or '16'}}
{% endblock %}
