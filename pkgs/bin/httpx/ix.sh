{% extends '//die/go/build.sh' %}

{% block pkg_name %}
httpx
{% endblock %}

{% block version %}
1.9.0
{% endblock %}

{% block go_url %}
https://github.com/projectdiscovery/httpx/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
efe4a8599a5e96c9089e4828689219993f8886fee42011020501c28faa0c5e03
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
