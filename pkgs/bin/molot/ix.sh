{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/6.tar.gz
{% endblock %}

{% block go_sha %}
3cf8985ebb84502f1a1dfb4cf194e934fa86678de35490bdca6c2c4952d177c9
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
