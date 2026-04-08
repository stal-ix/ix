{% extends '//die/go/build.sh' %}

{% block pkg_name %}
nuclei
{% endblock %}

{% block version %}
3.7.1
{% endblock %}

{% block go_url %}
https://github.com/projectdiscovery/nuclei/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
42f57a813533b4ed1f6337a4129d39a8297d448ba5a592c400fc4e52e8f0bbfd
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
