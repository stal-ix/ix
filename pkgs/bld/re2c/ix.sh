{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if native %}
bin/re2c(std_box=bld/boot/box)
{% else %}
bin/re2c
{% endif %}
{% endblock %}
