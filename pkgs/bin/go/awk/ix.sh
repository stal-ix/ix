{% extends '//die/go/build.sh' %}

{% block pkg_name %}
goawk
{% endblock %}

{% block version %}
1.30.0
{% endblock %}

{% block go_url %}
https://github.com/benhoyt/goawk/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
578b282d95778e0e135cf709b768ac74852cb460a4f7d3dd39aeb773f52ed177
{% endblock %}

{% block go_bins %}
goawk
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
