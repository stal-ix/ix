{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/16.tar.gz
{% endblock %}

{% block go_sha %}
49baaf8dac284f89fa8acc388a1c83e9d8b71398994193568b2df98e426bc27c
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
