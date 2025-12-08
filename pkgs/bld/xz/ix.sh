{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if native %}
bin/xz(std_box=bld/boot/box,intl_ver=no)
{% else %}
bin/xz(intl_ver=no)
{% endif %}
{% endblock %}
