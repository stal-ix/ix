{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/cmake/lite(std_box=bld/boot/box,intl_ver=no)
{% endblock %}
