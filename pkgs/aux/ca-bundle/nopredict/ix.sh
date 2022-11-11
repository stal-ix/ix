{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/curl/curl/archive/refs/tags/curl-7_80_0.tar.gz
sha:798d2b9432c93c96e7c103568d60f84a50d90875aa8cf4f9fe340005c480f2ea
{% include '//lib/nss/t/ver.sh' %}
{% endblock %}

{% block unpack %}
mkdir src; cd src
extract 1 ${src}/curl*
extract 1 ${src}/nss*
{% endblock %}

{% block bld_tool %}
bld/perl
bin/openssl
{% endblock %}

{% block build %}
cp nss/lib/ckfw/builtins/certdata.txt .
perl lib/mk-ca-bundle.pl -n -k - > ca-bundle.crt
{% endblock %}

{% block install %}
mkdir -p ${out}/share/ssl
cat ca-bundle.crt | grep -v '\##' > ${out}/share/ssl/cert.pem
{% endblock %}

{% block env %}
export CA_BUNDLE="${out}/share/ssl/cert.pem"
export OPENSSL_CERT_DIR="${out}/share/ssl"
{% endblock %}
