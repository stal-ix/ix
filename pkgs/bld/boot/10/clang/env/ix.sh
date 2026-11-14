{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/boot/10/clang(libc_lite=1)
bld/boot/9/env/box
{% endblock %}
