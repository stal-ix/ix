{% extends '//die/go/build.sh' %}

{% block pkg_name %}
dnsproxy
{% endblock %}

{% block version %}
0.84.1
{% endblock %}

{% block go_url %}
https://github.com/AdguardTeam/dnsproxy/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
4b3127909e9f1520dd84469584bd0e761c00587ce87e9ceb719b4ef5ced3c587
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}

{% block go_build_flags %}
{{super()}}
-o dnsproxy
{% endblock %}

{% block go_bins %}
dnsproxy
{% endblock %}
