{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/solod-dev/solod/archive/c70dfaf30476217c277b0eb81b5e450d8f6da56d.tar.gz
{% endblock %}

{% block go_sha %}
52c7c6626488038ea3d74353b7cfda73ce0cccb9809494783f9ca3cb79a46ab7
{% endblock %}

{% block go_bins %}
cmd/so/so
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}

{% block build %}
cd cmd/so
{{super()}}
{% endblock %}
