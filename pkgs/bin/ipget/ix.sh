{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/ipfs/ipget/archive/refs/tags/v0.10.0.tar.gz
{% endblock %}

{% block go_sha %}
3f9c3c09a089dff79b4b8560a65d704ade55cc4d4b4cef97b95956f31377531b
{% endblock %}

{% block go_compiler %}
bin/go/20
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ipget ${out}/bin/
{% endblock %}
