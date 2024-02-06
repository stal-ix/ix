{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/xyproto/gendesk/archive/refs/tags/1.0.9.tar.gz
{% endblock %}

{% block go_sha %}
sha:dd0008512eebc893e4b630d07d
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gendesk ${out}/bin/
{% endblock %}

{% block go_build_flags %}
-mod=vendor
{% endblock %}
