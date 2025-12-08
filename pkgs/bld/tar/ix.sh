{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if native %}
bin/bsdtar/lite(std_box=bld/boot/box)
{% else %}
bin/bsdtar
{% endif %}
{% endblock %}
