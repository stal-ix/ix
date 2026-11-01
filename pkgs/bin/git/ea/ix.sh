{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gitea
{% endblock %}

{% block version %}
28.3.0
{% endblock %}

{% block go_url %}
https://github.com/go-gitea/gitea/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
26faa5f25f97b46cfee297d7e672d7ab549f7462d280385e656c122900f06b3f
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}

{% block go_build_flags %}
{{super()}}
-o gitea
{% endblock %}

{% block go_bins %}
gitea
{% endblock %}
