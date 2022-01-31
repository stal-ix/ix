{% extends '//mix/template/c_std.sh' %}

{% block fetch %}
https://github.com/curl/curl/archive/refs/tags/curl-7_80_0.tar.gz
d96c3324dd060474508312449105d835
https://hg.mozilla.org/releases/mozilla-release/raw-file/default/security/nss/lib/ckfw/builtins/certdata.txt
sha:bb36818a81feaa4cca61101e6d6276cd09e972efcb08112dfed846918ca41d7f
{% endblock %}

{% block unpack %}
mkdir src; cd src; extract1 ${src}/*.tar.gz
{% endblock %}

{% block bld_tool %}
bld/perl
bin/openssl
{% endblock %}

{% block build %}
cp ${src}/certdata.txt .
perl lib/mk-ca-bundle.pl -n -k - > ca-bundle.crt
{% endblock %}

{% block install %}
mkdir -p ${out}/share/ssl
cp ca-bundle.crt ${out}/share/ssl/cert.pem
{% endblock %}

{% block env %}
export CA_BUNDLE="${out}/share/ssl/cert.pem"
export OPENSSL_CERT_DIR="${out}/share/ssl"
{% endblock %}
