{% extends '//die/go/build.sh' %}

{% block pkg_name %}
cosign
{% endblock %}

{% block version %}
3.0.6
{% endblock %}

{% block go_url %}
https://github.com/sigstore/cosign/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
de04832512620b2edd5f1f21bb8d18523f4ff47705748bb6e34d7699d82014e4
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/cosign
{% endblock %}

{% block go_bins %}
cosign
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
