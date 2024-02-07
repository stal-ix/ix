{% extends '//die/go/build.sh' %}

{# TODO(pg): get rid of /usr/bin/getent reference #}

{% block go_url %}
https://github.com/tvrzna/emptty/archive/refs/tags/v0.11.0.tar.gz
{% endblock %}

{% block go_sha %}
a8c9ad22240146687af3d67c2bcccecec76bf3d283d3bb500318cd919a242b11
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
