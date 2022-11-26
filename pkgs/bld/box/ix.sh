{%extends '//die/hub.sh' %}

{% block run_deps %}
bld/box/unwrap(std_box=bld/boot/box,intl_ver=no)
{% endblock %}
