{% extends '//die/go/build.sh' %}

{% block pkg_name %}
dnsx
{% endblock %}

{% block version %}
1.2.3
{% endblock %}

{% block go_url %}
https://github.com/projectdiscovery/dnsx/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
51a49a0578367be0a93f287836674d87b655969a619b5e7af43143f87652f138
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
