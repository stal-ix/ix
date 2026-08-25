{% extends '//die/go/build.sh' %}

{% block pkg_name %}
chroma
{% endblock %}

{% block version %}
2.27.0
{% endblock %}

{% block go_url %}
https://github.com/alecthomas/chroma/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
207bace8475db9521c9f264db2657eba55f9b2acd886e4d07b0b5c77689beed1
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/chroma
{% endblock %}

{% block go_bins %}
chroma
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
