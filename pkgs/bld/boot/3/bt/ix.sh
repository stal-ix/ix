{% extends '//bld/box/shim/ix.sh' %}

{% block bld_deps %}
bld/boot/2/env
{% endblock %}

{% block script_exec %}
["/bin/sh", "-s"]
{% endblock %}
