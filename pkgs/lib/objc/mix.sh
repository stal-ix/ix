{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
{% if mix.platform.target.os == 'darwin' %}
# use system objc runtime
lib/darwin/c/mix.sh
{% else %}
lib/objc/2/mix.sh
{% endif %}
{% endblock %}
