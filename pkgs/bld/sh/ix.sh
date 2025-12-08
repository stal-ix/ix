{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if native %}
bin/dash/sh(std_box=bld/boot/box)
{% else %}
bin/dash/sh
{% endif %}
{% endblock %}
