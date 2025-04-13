{% extends '//die/go/build.sh' %}

{% block pkg_name %}
webhook
{% endblock %}

{% block version %}
2.8.2
{% endblock %}

{% block go_url %}
https://github.com/adnanh/webhook/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
15ae99d4b2ddf4642e5c3dca5f63bf1da6e333c8dfe0f4e5191b17f165512fd1
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp webhook ${out}/bin/
{% endblock %}
