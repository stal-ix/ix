{% extends '//die/go/build.sh' %}

{% block pkg_name %}
restic
{% endblock %}

{% block version %}
0.20.0
{% endblock %}

{% block go_url %}
https://github.com/restic/restic/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
8b5a96d7fccecab22be89f813f76876cc5fd94aa1f9f360ca1286bf757da7cbb
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/restic
{% endblock %}

{% block go_bins %}
restic
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
