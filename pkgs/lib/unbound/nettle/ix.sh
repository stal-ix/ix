{% extends '//lib/unbound/t/t/ix.sh' %}

{% block lib_deps %}
{{super()}}
lib/nettle
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|#include "sha.h"|#include "sha1.h"\n#include "sha2.h"|' \
    -e '/sha[0-9]*_digest/s|, SHA[0-9]*_DIGEST_SIZE||' \
    -i validator/val_secalgo.c
{% endblock %}

{% block configure %}
{{super()}}
{% if darwin %}
cat << EOF >> config.h
int getentropy(void* buf, size_t len);
EOF
{% endif %}
{% endblock %}
