{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/auto/conf/archive(std_box=bld/boot/box)
{% endblock %}
