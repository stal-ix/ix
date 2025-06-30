{% extends '//die/go/build.sh' %}

{% block pkg_name %}
dnsproxy
{% endblock %}

{% block version %}
0.76.0
{% endblock %}

{% block go_url %}
https://github.com/AdguardTeam/dnsproxy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
e72818be11aec4fc27274d019bb9510de71d9321f2fac039ddeb56681d50d17d
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block go_bins %}
dnsproxy
{% endblock %}
