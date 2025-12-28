{% extends '//die/go/build.sh' %}

{% block pkg_name %}
chroma
{% endblock %}

{% block version %}
2.21.1
{% endblock %}

{% block go_url %}
https://github.com/alecthomas/chroma/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
993266ab0af6bd43153b08931b8be4ca04fd742fbf3546be2d2ed32a37d91d77
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
