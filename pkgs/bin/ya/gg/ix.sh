{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/gg/archive/412c6094c469c023e46d222e78c9f29ca4bdf7e9.zip
{% endblock %}

{% block go_sha %}
ef3447ba28981f7c2bc502c42961c192084e461eb3c49b8b0249df82b8c0570b
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gg ${out}/bin/ya
{% endblock %}
