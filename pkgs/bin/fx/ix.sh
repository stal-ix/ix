{% extends '//die/go/build.sh' %}

{% block pkg_name %}
fx
{% endblock %}

{% block version %}
40.0.0
{% endblock %}

{% block go_url %}
https://github.com/antonmedv/fx/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
ef13554eac8e2632bb3bfb787f3daf50564c26a8a431fce500a52292e00db56a
{% endblock %}

{% block go_bins %}
fx
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}
