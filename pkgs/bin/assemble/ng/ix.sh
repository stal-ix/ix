{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/assemble/archive/refs/tags/2.tar.gz
{% endblock %}

{% block go_sha %}
c3b95308680bb2755a37d8e5ffaacad5625cf4bd3a51965ea6c1d2282728a88c
{% endblock %}

{% block go_bins %}
assemble
{% endblock %}
