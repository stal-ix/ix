{% extends '//die/go/build.sh' %}

{% block pkg_name %}
dyff
{% endblock %}

{% block version %}
1.12.0
{% endblock %}

{% block go_url %}
https://github.com/homeport/dyff/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
477846ee7bb3ce817b806e21788ad2090a74e1c93d2849a5cf51f888b0c2a398
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/dyff
{% endblock %}

{% block go_bins %}
dyff
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
