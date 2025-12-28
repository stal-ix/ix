{% extends '//die/go/build.sh' %}

{% block pkg_name %}
goawk
{% endblock %}

{% block version %}
1.31.0
{% endblock %}

{% block go_url %}
https://github.com/benhoyt/goawk/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
2135ab54abb82f1e60eeaa0fc5d5ebf019fa423cc2fdfe53a46958e40b936571
{% endblock %}

{% block go_bins %}
goawk
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
