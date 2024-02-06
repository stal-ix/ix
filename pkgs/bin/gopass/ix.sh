{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/gopasspw/gopass/archive/refs/tags/v1.14.3.tar.gz
{% endblock %}

{% block go_sha %}
b1a0dd38ae84643393b4fe0d679b57f95eaf1e56bb902c6ce05551e9cf4d1237
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gopass ${out}/bin/
{% endblock %}
