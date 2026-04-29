{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/minio/warp/archive/refs/tags/v1.4.1.tar.gz
{% endblock %}

{% block go_sha %}
22fce7f8166c876865642064fcfa986f3d988ec3b498c07c6ec7ba97014d2b71
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_bins %}
warp
{% endblock %}
