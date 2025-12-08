{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if native %}
bin/minigzip/gzip(std_box=bld/boot/box)
{% else %}
bin/minigzip/gzip
{% endif %}
{% endblock %}
