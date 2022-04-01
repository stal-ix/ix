{% extends '//mix/hub.sh' %}

{% block lib_deps %}
lib/intl/{{intl_ver or 'gnu'}}
{% endblock %}
