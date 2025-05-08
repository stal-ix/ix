{% extends '//die/go/build.sh' %}

{% block pkg_name %}
dnsproxy
{% endblock %}

{% block version %}
0.75.4
{% endblock %}

{% block go_url %}
https://github.com/AdguardTeam/dnsproxy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
f9d31e5b55f96e83fc67790d2acbaa182f70f7757ef1393ea8a5684a65fefd89
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp dnsproxy ${out}/bin/
{% endblock %}
