{% extends '//lib/curl/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/bsd/overlay
lib/ng/tcp2/gnutls
{% endblock %}

# curl 8.21.0 narrowed --with-ca-fallback to OpenSSL only; up to 8.15.0
# GnuTLS was accepted too. The flag comes from //lib/curl/t, so turn it
# back off here, otherwise configure errors out.
{% block configure_flags %}
{{super()}}
--without-ca-fallback
{% endblock %}
