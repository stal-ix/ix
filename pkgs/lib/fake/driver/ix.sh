{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/shim/fake(lib_name=fakedriver)
{% endblock %}
