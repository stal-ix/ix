{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/boot/9/clang(libc_lite=1)
bld/boot/9/nasm
bld/boot/8/env/box
{% endblock %}
