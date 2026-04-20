{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block go_url %}
https://github.com/pg83/molot/archive/refs/tags/7.tar.gz
{% endblock %}

{% block go_sha %}
8c8ba8be3666dec9b7244a0c2bedbb4a84e1d8d256726c026141f0fc4cf20d2e
{% endblock %}

{% block go_bins %}
molot
{% endblock %}
