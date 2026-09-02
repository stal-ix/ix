{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/assemble/archive/refs/tags/3.tar.gz
{% endblock %}

{% block go_sha %}
20a74e5e31550377e4e5f782b72a61511c0b5e87ee84336506d89bc69a8fd6a1
{% endblock %}

{% block go_bins %}
assemble
{% endblock %}
