{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/isacikgoz/tldr/archive/refs/tags/v1.0.0-alpha.tar.gz
{% endblock %}

{% block go_sha %}
eab51c58359fa62af1be9050f0d106e86718a2ab0a74ba379caacd79b679f0d0
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/tldr
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp tldr ${out}/bin/
{% endblock %}
