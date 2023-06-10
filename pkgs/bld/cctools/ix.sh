{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if darwin %}
bin/cctools(std_box=bld/boot/box)
{% else %}
bin/cctools
{% endif %}
{% endblock %}
