{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/auto/conf/{{conf_ver or '2/69'}}(std_box=bld/boot/box)
{% endblock %}
