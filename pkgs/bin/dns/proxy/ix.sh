{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/AdguardTeam/dnsproxy/archive/refs/tags/v0.73.2.tar.gz
{% endblock %}

{% block go_sha %}
884260dba0b018e0e8c1330eec1afb006c94fd1244098952988d767ace708dd4
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp dnsproxy ${out}/bin/
{% endblock %}
