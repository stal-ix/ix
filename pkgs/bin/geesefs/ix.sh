{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/yandex-cloud/geesefs/archive/refs/tags/v0.42.0.tar.gz
{% endblock %}

{% block go_sha %}
qw
{% endblock %}

{% block go_tool %}
bld/git
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp geesefs ${out}/bin/
{% endblock %}
