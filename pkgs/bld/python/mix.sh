{% extends '//mix/hub.sh' %}

{% block run_deps %}
bin/python/lite(std_box=bld/boot/box,intl_ver=no)
{% endblock %}
