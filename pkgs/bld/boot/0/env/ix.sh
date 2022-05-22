{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if linux %}
bld/boot/0/sys
{% else %}
bld/boot/0/mix
{% endif %}
{% endblock %}
