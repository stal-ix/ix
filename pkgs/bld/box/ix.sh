{%extends '//die/hub.sh' %}

{% block run_deps %}
{% if native %}
bld/box/unwrap(std_box=bld/boot/box,intl_ver=no)
{% else %}
bld/box/unwrap(intl_ver=no)
{% endif %}
{% endblock %}
