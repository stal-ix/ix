{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/2.tar.gz
{% endblock %}

{% block go_sha %}
8fc87815dbace76fa84be104c49e5a1e1ef19b39ed46b1fc07fc119b553c235e
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
