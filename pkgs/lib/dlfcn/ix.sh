{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if linux %}
lib/dlfcn/abi
{% endif %}
lib/dlfcn/unwrap
{% endblock %}
