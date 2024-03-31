{% extends '//die/go/build.sh' %}

{# TODO(pg): get rid of /usr/bin/getent reference #}

{% block go_url %}
https://github.com/tvrzna/emptty/archive/refs/tags/v0.12.0.tar.gz
{% endblock %}

{% block go_sha %}
f05bbc5ac5ba964475541997ba72a56cd4f7c4f10e72fdd70fab2d749738cf61
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
