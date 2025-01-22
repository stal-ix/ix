{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/gg/archive/612a55279ddd0fc96b82ad310798be08153a57c2.zip
{% endblock %}

{% block go_sha %}
967b45a61426cfd10ebe3831e9faf405b90965104e2ef016b2375eb581089400
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gg ${out}/bin/ya
{% endblock %}
