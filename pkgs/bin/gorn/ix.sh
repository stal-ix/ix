{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/26.tar.gz
{% endblock %}

{% block go_sha %}
0975c2371d9a80bcd7fd87b3f8a77a3d035c2625967143e564ac217f2de13f71
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
