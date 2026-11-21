{% extends '//die/go/build.sh' %}

{% block pkg_name %}
fx
{% endblock %}

{% block version %}
40.0.2
{% endblock %}

{% block go_url %}
https://github.com/antonmedv/fx/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
e44859a08c2d73a9ea514958f3f17c623ab241694e9f2ed6513ff8ea4693bc92
{% endblock %}

{% block go_bins %}
fx
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
