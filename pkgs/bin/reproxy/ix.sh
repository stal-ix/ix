{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/umputun/reproxy/archive/refs/tags/v1.2.2.tar.gz
{% endblock %}

{% block go_sha %}
6afa743ca66df048e35d747da698f630d76849eae9fa18ae1a2a9dd0606ea0a3
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block unpack %}
{{super()}}
cd app
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp app ${out}/bin/reproxy
{% endblock %}
