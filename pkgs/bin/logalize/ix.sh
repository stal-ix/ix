{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/deponian/logalize/archive/refs/tags/v0.4.1.tar.gz
{% endblock %}

{% block go_sha %}
86e91f334749484e2e3b699a99b176abe49d943e0ad39bf7cdcc76b8d09b6ce9
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp logalize ${out}/bin/
{% endblock %}
