{% extends '//die/go/pure.sh' %}

{# TODO(pg): get rid of /usr/bin/getent reference #}

{% block go_url %}
https://github.com/tvrzna/emptty/archive/refs/tags/v0.10.0.tar.gz
{% endblock %}

{% block go_sha %}
sha:081cc826ec8e8d9239ca7fafe71c2b8074b63c1948efceb3d635fc20dcf99621
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
