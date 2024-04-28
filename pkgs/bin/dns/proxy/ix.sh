{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/AdguardTeam/dnsproxy/archive/refs/tags/v0.71.0.tar.gz
{% endblock %}

{% block go_sha %}
8cd297a615df48357d330f48d31f3b6e70e703958bf2bc2fc516bfe2aea05370
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp dnsproxy ${out}/bin/
{% endblock %}
