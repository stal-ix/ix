{% extends '//die/go/build.sh' %}

{# TODO(pg): get rid of /usr/bin/getent reference #}

{% block go_url %}
https://github.com/tvrzna/emptty/archive/refs/tags/v0.11.0.tar.gz
{% endblock %}

{% block go_sha %}
f9ddee1069a0120e3180cb1f9e6cb08c048a08f29e0be972510008fc7353eeaf
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
