{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/AdguardTeam/dnsproxy/archive/refs/tags/v0.74.1.tar.gz
{% endblock %}

{% block go_sha %}
98f58edeeb27a671ab56ea0d30cfb5d77600316ac03689d5ae9c1a2ab80808c1
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp dnsproxy ${out}/bin/
{% endblock %}
