{% extends '//die/go/build.sh' %}

{% block pkg_name %}
httpx
{% endblock %}

{% block version %}
1.11.0
{% endblock %}

{% block go_url %}
https://github.com/projectdiscovery/httpx/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
6b70459303ab14142eb587a3ccd36dcf4126b33c05afe0a9433dd1f90d6f442b
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
