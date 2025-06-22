{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/minio/mc/archive/refs/tags/RELEASE.2024-03-30T15-29-52Z.tar.gz
{% endblock %}

{% block go_sha %}
e8baf6877a73bda833ef2b80dc27e5d0edaeb7f4b44ce46ae66ed873da5d977d
{% endblock %}

{% block go_bins %}
mc
{% endblock %}
