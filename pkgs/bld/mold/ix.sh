{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mold(std_env=bld/boot/8/env/cxx,openssl=md,libc_lite=1)
{% endblock %}

{% block ind_deps %}
bld/mold/lib
{% endblock %}
