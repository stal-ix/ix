{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/gokcehan/lf/archive/refs/tags/r34.tar.gz
{% endblock %}

{% block go_sha %}
014669b70d4a24de7e8c36f75ab177c41bd353ed1792f1cd766f8bf36fc893b3
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lf ${out}/bin/
{% endblock %}
