{% extends '//die/go/pure.sh' %}

{# TODO(pg): get rid of /usr/bin/getent reference #}

{% block go_url %}
https://github.com/tvrzna/emptty/archive/refs/tags/v0.9.1.tar.gz
{% endblock %}

{% block go_sum %}
sha:1b3c940da8d60705306525bf5a7619a7b30d954679e30a978a03ac53357e57d4
{% endblock %}

{% block go_sha %}
sha:bbaace8c393de092878fdc31fc5813ae56d945dfeab4306a482fd49480357eda
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
