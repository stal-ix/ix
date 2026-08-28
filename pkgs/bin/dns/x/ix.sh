{% extends '//die/go/build.sh' %}

{% block pkg_name %}
dnsx
{% endblock %}

{% block version %}
1.3.0
{% endblock %}

{% block go_url %}
https://github.com/projectdiscovery/dnsx/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
e84547ac1feef4976521178b892c8778c0f46e18454fa6059b5e707d6cef80de
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/dnsx
{% endblock %}

{% block go_bins %}
dnsx
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
