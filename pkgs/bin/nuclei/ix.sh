{% extends '//die/go/build.sh' %}

{% block pkg_name %}
nuclei
{% endblock %}

{% block version %}
3.11.1
{% endblock %}

{% block go_url %}
https://github.com/projectdiscovery/nuclei/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
e4285ba07e168a2b2ec5f427b7199cd403adbeca692fbe51565e450b2a66743a
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/nuclei
{% endblock %}

{% block go_bins %}
nuclei
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
