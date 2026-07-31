{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/26.tar.gz
{% endblock %}

{% block go_sha %}
1d63a07a6998b4c66b5499d4551e6ae4d99db3c8456ac935c66ed8f587dd1c9d
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
