{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/benhoyt/goawk/archive/refs/tags/v1.22.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:d3234daa2e185b9690e77bb06a2d703db7da70111a52456aedee02a191e26fb6
{% endblock %}

{% block go_sha %}
sha:2e2ae319a0beea4c17f24875d10fd708d02f793b92a6613b9d67fc5e57b7796f
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp goawk ${out}/bin/
{% endblock %}
