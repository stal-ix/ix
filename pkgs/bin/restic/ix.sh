{% extends '//die/go/build.sh' %}

{% block pkg_name %}
restic
{% endblock %}

{% block version %}
0.18.1
{% endblock %}

{% block go_url %}
https://github.com/restic/restic/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
5fd3bb3e73de474c85e518eeec1915f6f4fd48fa4252b474d2c06a3ab08cf507
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/restic
{% endblock %}

{% block go_bins %}
restic
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
