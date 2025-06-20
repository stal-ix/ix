{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/minio/minio/archive/refs/tags/RELEASE.2024-04-06T05-26-02Z.tar.gz
{% endblock %}

{% block go_sha %}
ebbff8def580f28e6435a585bc2d24b3cbb58c5610f39a5b8492663f2d9eb218
{% endblock %}

{% block go_bins %}
minio
{% endblock %}
