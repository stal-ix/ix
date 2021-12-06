{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
{% if target.os == 'linux' %}
lib/mesa/mix.sh
{% endif %}
{% if target.os == 'darwin' %}
lib/darwin/framework/Carbon/mix.sh
{% endif %}
{% endblock %}
