{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if all_system %}
bin/bsdtar(intl_ver=no,libc_lite=1)
{% elif system_tar %}
bld/system
{% elif native %}
bin/bsdtar/lite(std_box=bld/boot/box)
{% else %}
bin/bsdtar
{% endif %}
{% endblock %}
