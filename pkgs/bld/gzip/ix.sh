{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system or system_gzip %}
bld/system
{% elif native %}
bin/minigzip/gzip(std_box=bld/boot/box)
{% else %}
bin/minigzip/gzip
{% endif %}
{% endblock %}
