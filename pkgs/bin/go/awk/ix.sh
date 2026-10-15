{% extends '//die/go/build.sh' %}

{% block pkg_name %}
goawk
{% endblock %}

{% block version %}
1.32.0
{% endblock %}

{% block go_url %}
https://github.com/benhoyt/goawk/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
826b620ad9fcecb5989e9a41b051ce84d15ffa65a5000c630f81a88b5350a10b
{% endblock %}

{% block go_bins %}
goawk
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
