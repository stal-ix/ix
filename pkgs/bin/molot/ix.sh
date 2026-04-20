{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/4.tar.gz
{% endblock %}

{% block go_sha %}
0e9373668912c75fb5ad177022209b363151eb3fcf559a4dd441431af3c1ac61
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
