{% extends '//lib/unbound/t/t/ix.sh' %}

{% block lib_deps %}
{{super()}}
lib/nettle
{% endblock %}

{% block configure %}
{{super()}}
{% if darwin %}
cat << EOF >> config.h
int getentropy(void* buf, size_t len);
EOF
{% endif %}
{% endblock %}
