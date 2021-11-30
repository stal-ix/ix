{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
lib/udev/{{udev or 'zero'}}/mix.sh
{% endblock %}
