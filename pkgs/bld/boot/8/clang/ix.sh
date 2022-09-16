{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if linux %}
bld/boot/8/clang/base(libc=musl/pure,allocator=musl/pure,cplpl_std=13)
{% else %}
bld/boot/8/clang/base
{% endif %}
{% endblock %}
