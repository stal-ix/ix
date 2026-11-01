{% extends '//die/go/build.sh' %}

{% block pkg_name %}
forgejo
{% endblock %}

{% block version %}
17.0.1
{% endblock %}

{% block go_url %}
https://codeberg.org/forgejo/forgejo/archive/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
b223be12902aba6363f1f971f68a9bc0ad9f6ac8d531fc6790deffa8c7cf466b
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}

{% block go_build_flags %}
{{super()}}
-o forgejo
{% endblock %}

{% block go_bins %}
forgejo
{% endblock %}
