{% extends 't/ix.sh' %}

{% block lib_deps %}
lib/c
lib/z
lib/psl
lib/zstd
lib/ssh/2
lib/idn/2
lib/brotli
lib/c/ares
lib/ca/bundle
lib/ng/http/2
{% if darwin %}
lib/darwin/framework/SystemConfiguration
{% endif %}
{% endblock %}

{% block configure_flags %}
{{super()}}
{% if linux %}
{% if libcurl_no_fallback %}
{% else %}
--with-ca-fallback
{% endif %}
--with-ca-bundle=/etc/ssl/cert.pem
{% endif %}
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|CURL_CA_BUNDLE|CURL_CA_BUNDLE_STATIC|' \
    -i lib/version.c
{% endblock %}

{% block configure %}
{{super()}}
cat << EOF >> lib/curl_config.h
#define CURL_CA_BUNDLE_STATIC "/etc/ssl/cert.pem"
#undef CURL_CA_BUNDLE
#include <ca_bundle.h>
#define CURL_CA_BUNDLE (ix_ca_bundle())
EOF
{% endblock %}
