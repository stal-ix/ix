{% extends '//die/go/build.sh' %}

{% block pkg_name %}
u-root
{% endblock %}

{% block version %}
0.14.0
{% endblock %}

{% block go_url %}
https://github.com/u-root/u-root/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
d09be6f411cc9d1d58c284fa98d025dcf30f5f03da7ce4b01cf32393e9efb3c9
{% endblock %}

{% block go_bins %}
u-root
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}
