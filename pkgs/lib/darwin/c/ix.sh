{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/build
lib/darwin/c/dispatch(sdk_target={{sdk_target or 11.0}})
{% endblock %}
