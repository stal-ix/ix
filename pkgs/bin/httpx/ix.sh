{% extends '//die/go/build.sh' %}

{% block pkg_name %}
httpx
{% endblock %}

{% block version %}
1.10.0
{% endblock %}

{% block go_url %}
https://github.com/projectdiscovery/httpx/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
22083680f68bb0a0afe3f0fb41d037034471ee85ee8fd5b4d53b0eb2cf196d1a
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/httpx
{% endblock %}

{% block go_bins %}
httpx
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
