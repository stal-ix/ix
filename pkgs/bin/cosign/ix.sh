{% extends '//die/go/build.sh' %}

{% block pkg_name %}
cosign
{% endblock %}

{% block version %}
3.1.3
{% endblock %}

{% block go_url %}
https://github.com/sigstore/cosign/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
a974ac4625e91016ce1f247aa4f2c8caa7e61731e220c97c97f2226ce6d71acb
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
