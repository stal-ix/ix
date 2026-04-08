{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gron
{% endblock %}

{% block version %}
0.7.1
{% endblock %}

{% block go_url %}
https://github.com/tomnomnom/gron/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
d92f455655b95ce9f6df4af20d991806dec2cf0dd20b6827cc389621700d767d
{% endblock %}

{% block go_bins %}
gron
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
