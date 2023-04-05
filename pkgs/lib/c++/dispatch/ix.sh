{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/c++/{{cplpl_std or '16'}}
{% endblock %}
