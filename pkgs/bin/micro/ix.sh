{% extends '//die/go/build.sh' %}

{% block pkg_name %}
micro
{% endblock %}

{% block version %}
2.0.15
{% endblock %}

{% block go_url %}
https://github.com/zyedidia/micro/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
e089b7f13140cfcfe0c74ca2c7819b1bc3b2798edb9a10928004f2f206e0424d
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/micro
{% endblock %}

{% block go_bins %}
micro
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
