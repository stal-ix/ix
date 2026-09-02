{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/29.tar.gz
{% endblock %}

{% block go_sha %}
f1a91a190a24cd0f934355e12daa5bd158b6d060fe69c3b5c5c3d646a2c08842
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
