{% extends '//mix/hub.sh' %}

{% block lib_deps %}
lib/c++/{{cplpl_std or 'any'}}
{% endblock %}
