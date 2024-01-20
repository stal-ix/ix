{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if linux %}
bld/boot/8/nasm/base(libc=musl/pure,purec=musl/pure)
{% else %}
bld/boot/8/nasm/base
{% endif %}
{% endblock %}
