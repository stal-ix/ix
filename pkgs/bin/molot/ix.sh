{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/28.tar.gz
{% endblock %}

{% block go_sha %}
0a8a5e17aa11f2c47d212573868d7a51052cea56337d6cb0ea4d8428c5bae940
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
