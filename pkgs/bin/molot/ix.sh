{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/21.tar.gz
{% endblock %}

{% block go_sha %}
74f1da192ab3ec3aea053cc27623a9d64ddd18d5fa1be41a28d652babae95178
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
