{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if native %}
bin/python/lite(std_box=bld/boot/box,intl_ver=no)
{% else %}
bin/python/lite(intl_ver=no)
{% endif %}
{% endblock %}
