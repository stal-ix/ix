{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/gg/archive/556fe3d54160bb266248171f7d603fd1ad2c37ea.zip
{% endblock %}

{% block go_sha %}
90fb564631467e4b4e855ee223185725d3d273428c919bf59ccf506755399504
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gg ${out}/bin/ya
{% endblock %}
