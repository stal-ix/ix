{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/ipfs/ipget/archive/refs/tags/v0.9.2.tar.gz
{% endblock %}

{% block go_sha %}
d4d5d1768879756c5ccf74a8d04f00a6562a5a87180b0ea1ff64ee733e42ebe4
{% endblock %}

{% block go_compiler %}
bin/go/20
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ipget ${out}/bin/
{% endblock %}
