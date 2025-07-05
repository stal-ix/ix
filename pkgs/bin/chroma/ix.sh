{% extends '//die/go/build.sh' %}

{% block pkg_name %}
chroma
{% endblock %}

{% block version %}
2.19.0
{% endblock %}

{% block go_url %}
https://github.com/alecthomas/chroma/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
3332898f95b58cc72141e5f9393886ee78f92021661ea12055943148b49916e5
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/chroma
{% endblock %}

{% block go_bins %}
chroma
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
