{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/darkhz/bluetuith/archive/refs/tags/v0.1.7.tar.gz
{% endblock %}

{% block go_sha %}
e9226fc57118d73d2fc7552bd87bf85eb15442c5b277c32159f195dd89b1a25e
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp bluetuith ${out}/bin/
{% endblock %}
