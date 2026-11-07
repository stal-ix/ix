{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gdu
{% endblock %}

{% block version %}
5.39.0
{% endblock %}

{% block go_url %}
https://github.com/dundee/gdu/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
b76f0fc6bcc4e5c4d3ffa2e2c81accf907781ec946d31e1743fe41697a3bb7e4
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gdu
{% endblock %}

{% block go_bins %}
gdu
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
