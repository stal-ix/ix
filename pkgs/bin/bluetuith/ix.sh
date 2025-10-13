{% extends '//die/go/build.sh' %}

{% block pkg_name %}
bluetuith
{% endblock %}

{% block version %}
0.2.5
{% endblock %}

{% block go_url %}
https://github.com/darkhz/bluetuith/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
30f7962a15f0c5084753e3ab895254073f63a8de383da05aaacf81ea5826db97
{% endblock %}

{% block go_bins %}
bluetuith
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
