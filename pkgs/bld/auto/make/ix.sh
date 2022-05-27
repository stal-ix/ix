{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/auto/make/{{make_ver or '1/16/5'}}(std_box=bld/boot/box)
{% endblock %}
