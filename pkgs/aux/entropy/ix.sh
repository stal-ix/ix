{% extends '//die/proxy.sh' %}

{% block bld_tool %}
bin/openssl
{% endblock %}

{% block install %}
mkdir -p ${out}/share
openssl enc -aes-256-ctr \
    -pass pass:{{entropy_seed}} \
    -nosalt                     \
    < /dev/zero                 \
    | head -c {{entropy_size}}  \
    > ${out}/share/entropy
{% endblock %}

{% block env %}
export ENTROPY=${out}/share/entropy
{% endblock %}
