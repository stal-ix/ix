{% extends '//die/go/pure.sh' %}

{# TODO(pg): get rid of /usr/bin/getent reference #}

{% block go_url %}
https://github.com/tvrzna/emptty/archive/refs/tags/v0.9.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:530da58d898c499516b5f5b189e1c86801df949fb794c2242de652ef3ee65d15
{% endblock %}

{% block go_sha %}
sha:
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
