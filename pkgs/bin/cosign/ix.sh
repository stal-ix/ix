{% extends '//die/go/build.sh' %}

{% block pkg_name %}
cosign
{% endblock %}

{% block version %}
3.1.4
{% endblock %}

{% block go_url %}
https://github.com/sigstore/cosign/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
34d1020e0df86a40140318550866c968410eeeeb176f3ef5bf3ea3cb62fcdd50
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/cosign
{% endblock %}

{% block go_bins %}
cosign
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
