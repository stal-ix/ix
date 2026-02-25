{% extends '//die/go/build.sh' %}

{% block pkg_name %}
chroma
{% endblock %}

{% block version %}
2.23.1
{% endblock %}

{% block go_url %}
https://github.com/alecthomas/chroma/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
6b46c090b175bdb0baaae6c8d54863e454601ef48911d86cab5fa3ba524b8f72
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
