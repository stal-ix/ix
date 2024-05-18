{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if linux %}
bld/boot/9/clang(libc=musl/pure,purec=musl/unwrap)
{% else %}
bld/boot/9/clang
{% endif %}
bld/boot/9/nasm
bld/boot/8/env/box
{% endblock %}
