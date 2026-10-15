{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/37.tar.gz
{% endblock %}

{% block go_sha %}
3568e50cb5c73ab4684d326d3cafa7dd10f99202eac0632d2ec69cab6401e07c
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
