{% extends '//die/go/build.sh' %}

{% block pkg_name %}
dyff
{% endblock %}

{% block version %}
1.9.4
{% endblock %}

{% block go_url %}
https://github.com/homeport/dyff/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
55506f70b2a2e4acbec33d0050b41da0621bac2a7e61d63c341e7e6585145638
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/dyff
{% endblock %}

{% block go_bins %}
dyff
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
