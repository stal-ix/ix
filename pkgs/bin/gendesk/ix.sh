{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/xyproto/gendesk/archive/refs/tags/1.0.9.tar.gz
{% endblock %}

{% block go_sha %}
1441a2f11499fc6bdb6b61ec9be3d25fca3ea7bb42981cca364193b96fd2ca26
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gendesk ${out}/bin/
{% endblock %}

{% block go_version %}
v3
{% endblock %}
