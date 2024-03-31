{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/rsteube/carapace-bin/archive/refs/tags/v0.29.1.tar.gz
{% endblock %}

{% block go_sha %}
cd81c4f0581559a8ab9ff767789dd6935ab47b0fe6fe9ba0ac308775beb443e3
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/carapace
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp carapace ${out}/bin/
{% endblock %}
