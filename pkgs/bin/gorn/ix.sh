{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/10.tar.gz
{% endblock %}

{% block go_sha %}
cfb967c7ca6d4068520220f2c70ade2758859c07a231e0ab13f53526eb05bcc0
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
