{% extends '//die/hub.sh' %}

{% block run_deps %}
{% if linux %}
bld/boot/8/clang/base(libc=musl/pure,purec=musl/unwrap,libcplpl_ver=13/gcc,crt_ver=hack/ish)
{% else %}
bld/boot/8/clang/base
{% endif %}
{% endblock %}
