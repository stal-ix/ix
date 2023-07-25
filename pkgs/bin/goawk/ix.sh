{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/benhoyt/goawk/archive/refs/tags/v1.24.0.tar.gz
{% endblock %}

{% block go_sha %}
sha:7005be5287fb18932d1349464bf7297bbc8eec8c78e072e496d4470d33460c79
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp goawk ${out}/bin/
{% endblock %}
