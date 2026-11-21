{% extends '//die/go/build.sh' %}

{% block pkg_name %}
forgejo
{% endblock %}

{% block version %}
17.0.2
{% endblock %}

{% block go_url %}
https://codeberg.org/forgejo/forgejo/archive/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
5febf4d48f26f389c0762b65e7ea3a935344460bb3804108545e5cc3f2f43a6e
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
