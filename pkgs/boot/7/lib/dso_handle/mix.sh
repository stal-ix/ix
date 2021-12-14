{% extends '//mix/template/c_std.sh' %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
boot/6/env/std/mix.sh
{% endblock %}

{% block step_unpack %}
{% endblock %}

{% block build %}
cat << EOF > dso.c
void* __dso_handle;
EOF

cc -c dso.c
ar qs libdso_handle.a dso.o
{% endblock %}

{% block install %}
mkdir ${out}/lib && cp libdso_handle.a ${out}/lib/
{% endblock %}
