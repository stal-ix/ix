{% extends '//lib/gnutls/t/mix.sh' %}

{% block configure_flags %}
{{super()}}
--disable-tests
--disable-tools
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-gnutls=${out} \${COFLAGS}"
{% endblock %}
