{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/21.tar.gz
{% endblock %}

{% block go_sha %}
9a0d2da030022dba4d607d7cef3e7070c3bd1021d259d08bc4ae1da535edd0de
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
