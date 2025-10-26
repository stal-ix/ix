{% extends '//die/go/build.sh' %}

{% block pkg_name %}
cli
{% endblock %}

{% block version %}
2.82.1
{% endblock %}

{% block go_url %}
https://github.com/cli/cli/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
07a79f68c7eb5c033b24d270d320850ddd387d095aa1878b8773eb38f7064fe6
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gh
{% endblock %}

{% block go_bins %}
gh
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
