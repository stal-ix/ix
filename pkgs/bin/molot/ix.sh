{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/29.tar.gz
{% endblock %}

{% block go_sha %}
a970ccbd8ddc8abccf2239c743915ce3941f3f964a2857d6ed4ac217a31d465f
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
