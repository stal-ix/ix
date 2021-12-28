{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
{% if target.os == 'darwin' %}
# use system objc runtime
lib/darwin/c
{% else %}
lib/objc/2
{% endif %}
{% endblock %}
