{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/boot/8/clang/base(libc_lite=1,libcplpl_ver=13/gcc,crt_ver=hack/ish,boot=1)
{% endblock %}
