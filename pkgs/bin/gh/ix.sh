{% extends '//die/go/build.sh' %}

{% block pkg_name %}
cli
{% endblock %}

{% block version %}
2.105.0
{% endblock %}

{% block go_url %}
https://github.com/cli/cli/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
2df586166187d381f6cf54814f053c924aa5a6cb46eabb594250fa5cb38a7ae4
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gh
{% endblock %}

{% block go_bins %}
gh
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
