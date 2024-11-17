{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/boot/10/nasm/base(libc_lite=1)
{% endblock %}
