{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://github.com/benhoyt/goawk/archive/refs/tags/v1.25.0.tar.gz
{% endblock %}

{% block go_sha %}
e14257a1c634c5d453576e00ecffdc15c60d7652dda55674276508f97ccd4501
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp goawk ${out}/bin/
{% endblock %}
