{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/boot/9/nasm/base(libc_lite=1)
{% endblock %}
