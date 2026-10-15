{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}

{% block go_url %}
https://github.com/cloudlena/s3manager/archive/refs/tags/v0.10.0.tar.gz
{% endblock %}

{% block go_sha %}
5b54c200bb8b3de02c914742e1e05a6d8251e9130f21b0c3a56ace784fef3503
{% endblock %}

{% block go_bins %}
s3manager
{% endblock %}

{% block patch %}
grep -q '":" + configuration.Port' main.go
sed -i 's|":" + configuration.Port|"127.0.0.1:" + configuration.Port|' main.go
{% endblock %}
