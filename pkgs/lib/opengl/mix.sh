{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
{% if mix.platform.target.os == 'linux' %}
lib/mesa/mix.sh
{% endif %}
{% if mix.platform.target.os == 'darwin' %}
lib/darwin/framework/Carbon/mix.sh
{% endif %}
{% endblock %}
