{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if linux %}
bld/compiler/0(libc=musl/pure,purec=musl/unwrap)
{% else %}
bld/compiler/0
{% endif %}
bld/boot/8/env/box
{% endblock %}
