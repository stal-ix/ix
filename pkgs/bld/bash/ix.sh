{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if native %}
bin/bash/lite(std_box=bld/boot/box)
{% else %}
bin/bash/lite
{% endif %}
{% endblock %}
