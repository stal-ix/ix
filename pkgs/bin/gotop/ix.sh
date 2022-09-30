{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/xxxserxxx/gotop/archive/refs/tags/v4.2.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:e9d9041903acb6bd3ffe94e0a02e69eea53f1128274da1bfe00fe44331ccceb1
{% endblock %}

{% block go_sha %}
sha:a041fee8bb5866a29d452cd161d56900b8ae34c8d571c9d587691955a2e8b247
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gotop
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gotop ${out}/bin/
{% endblock %}
