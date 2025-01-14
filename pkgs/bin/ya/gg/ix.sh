{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/gg/archive/13475763df8faee726a8dfffc94498bb808aba64.zip
{% endblock %}

{% block go_sha %}
d8753c8d2567825e782fac877e488d40662478154025ed02211a0a1812537e0e
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gg ${out}/bin/ya
{% endblock %}
