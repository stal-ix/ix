{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block go_url %}
https://github.com/pg83/gorn/archive/refs/tags/7.tar.gz
{% endblock %}

{% block go_sha %}
f2f8d61b564b82d8798a7e4dfc6a39dfdaa2c573f598139261f41b9511212895
{% endblock %}

{% block go_bins %}
gorn
{% endblock %}
