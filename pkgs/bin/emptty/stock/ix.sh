{% extends '//die/go/build.sh' %}

{# TODO(pg): get rid of /usr/bin/getent reference #}

{% block go_url %}
https://github.com/tvrzna/emptty/archive/refs/tags/v0.13.0.tar.gz
{% endblock %}

{% block go_sha %}
ffc6c77bcfc8edc4846008517810d17f40974015a87c2ee570c19bd841f34832
{% endblock %}

{% block go_tags %}
nopam
noxlib
noutmp
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp emptty ${out}/bin/
{% endblock %}
