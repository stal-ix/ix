{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/pg83/wirez/archive/refs/tags/5.tar.gz
{% endblock %}

{% block go_sha %}
fd69373b6c30e33da29086f408d8a43be45c265ab5da06c308857c773e9d8d85
{% endblock %}

{% block go_bins %}
wirez
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
