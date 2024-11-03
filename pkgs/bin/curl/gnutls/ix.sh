{% extends '//lib/curl/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/bsd/overlay
lib/ng/tcp2/gnutls
{% endblock %}

{% block setup_target_flags %}
{{super()}}
export COFLAGS=$(echo "${COFLAGS}" | tr ' ' '\n' | grep -v with-openssl | tr '\n' ' ')
{% endblock %}
