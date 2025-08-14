{% extends '//die/go/build.sh' %}

{% block pkg_name %}
chroma
{% endblock %}

{% block version %}
2.20.0
{% endblock %}

{% block go_url %}
https://github.com/alecthomas/chroma/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
4aae9f87a008c0c9d47fae840ad102e66e20528d4b6b6078c7ee9e347d48239b
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
