{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gojq
{% endblock %}

{% block version %}
0.12.19
{% endblock %}

{% block go_url %}
https://github.com/itchyny/gojq/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
6d5795e9f50e0c7190e8cddf4ba95bd447b221ffd5ee676e9dd246cd568b8de3
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gojq
{% endblock %}

{% block go_bins %}
gojq
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
