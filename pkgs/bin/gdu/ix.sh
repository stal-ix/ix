{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gdu
{% endblock %}

{% block version %}
5.33.0
{% endblock %}

{% block go_url %}
https://github.com/dundee/gdu/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
0df71cf7ce8babb7bd9e4c81d20688e95fc432748c8d5ccec1d629b165fe453a
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gdu
{% endblock %}

{% block go_bins %}
gdu
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
