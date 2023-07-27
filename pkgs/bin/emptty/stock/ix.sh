{% extends '//die/go/pure.sh' %}

{# TODO(pg): get rid of /usr/bin/getent reference #}

{% block go_url %}
https://github.com/tvrzna/emptty/archive/refs/tags/v0.10.0.tar.gz
{% endblock %}

{% block go_sha %}
45cb5da14a10e7233e73128b0e27d7d503928f86532829ae48b8e62adf1a84d4
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
