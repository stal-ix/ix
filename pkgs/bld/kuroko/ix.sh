{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system %}
bin/kuroko/lite
{% elif native %}
bin/kuroko/lite(std_box=bld/boot/box)
{% else %}
bin/kuroko/lite
{% endif %}
{% endblock %}
