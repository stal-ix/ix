{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if native %}
bin/libtool(std_box=bld/boot/box)
{% else %}
bin/libtool
{% endif %}
{% endblock %}
