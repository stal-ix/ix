{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/assemble/archive/refs/tags/3.tar.gz
{% endblock %}

{% block go_sha %}
1f19984d4a774ee364144b48e82a7cddf362085be0c6773621c0c904dc02e90a
{% endblock %}

{% block go_bins %}
assemble
{% endblock %}
