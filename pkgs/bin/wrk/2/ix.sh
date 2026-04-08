{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/giltene/wrk2
{% endblock %}

{% block git_commit %}
44a94c17d8e6a0bac8559b53da76848e430cb7a7
{% endblock %}

{% block git_sha %}
54f9fbb5febf3a44ab011a15ee7a2ac82dcc64bbb711f42d8a8b65873968c9ae
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/openssl/1
lib/build/muldefs
{% endblock %}

{% block cpp_missing %}
sys/time.h
{% endblock %}

{% block bld_tool %}
bin/ld
{% endblock %}

{% block setup_target_flags %}
export LDFLAGS=$(echo ${LDFLAGS} | sed -e 's|=lld|=ld|g' | sed -e 's|-icf=safe||')
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp wrk ${out}/bin/
{% endblock %}
