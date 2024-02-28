{% extends '//die/go/build.sh' %}

{# TODO(pg): get rid of /usr/bin/getent reference #}

{% block go_url %}
https://github.com/tvrzna/emptty/archive/refs/tags/v0.12.0.tar.gz
{% endblock %}

{% block go_sha %}
f2dc327381f60f8fb1c0ce2b31b10dd07429ab346f69d9f645dfa75f2cb4337c
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
