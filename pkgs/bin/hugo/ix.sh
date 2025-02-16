{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/gohugoio/hugo/archive/refs/tags/v0.143.1.tar.gz
{% endblock %}

{% block go_sha %}
34dfb24169e71743d92f39e9b38d0908db066068c90c6295680fc23b581be652
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp hugo ${out}/bin/
{% endblock %}
