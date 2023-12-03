{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if target.obj_fmt == 'elf' %}
lib/idn/2/elf
{% else %}
lib/idn/2/other
{% endif %}
{% endblock %}
