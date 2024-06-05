{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/perl/host(std_box=bld/boot/box,libgdbm_ver=boot,sdk_target=10.15)
{% endblock %}
