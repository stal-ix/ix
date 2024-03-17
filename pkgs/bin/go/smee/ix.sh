{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/chmouel/gosmee/archive/refs/tags/v0.21.0.tar.gz
{% endblock %}

{% block go_sha %}
3691896627e9442b924d87c4b7d5ad7a3ad7ac6d7a47a3abb9a1c6f3c1e973ab
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gosmee.bin ${out}/bin/gosmee
{% endblock %}

{% block go_build_flags %}
-o gosmee.bin
{% endblock %}
