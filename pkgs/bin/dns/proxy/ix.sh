{% extends '//die/go/build.sh' %}

{% block pkg_name %}
dnsproxy
{% endblock %}

{% block version %}
0.86.0
{% endblock %}

{% block go_url %}
https://github.com/AdguardTeam/dnsproxy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
05f55acabb48e3ca70cb033fdf99a2acc915e5acdb5e9ed62f1574a895562678
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}

{% block go_build_flags %}
{{super()}}
-o dnsproxy
{% endblock %}

{% block go_bins %}
dnsproxy
{% endblock %}
