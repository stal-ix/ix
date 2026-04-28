{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/c8358d7243ecf1f37febb28af7eeb408b1603f54.tar.gz
{% endblock %}

{% block go_sha %}
cbcd4e89db5f63868b2c6f2c321cb9e9dee6f2463de609551090edc7ad62366c
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
