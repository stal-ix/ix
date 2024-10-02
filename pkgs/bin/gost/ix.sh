{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/go-gost/gost/archive/refs/tags/v3.0.0-nightly.20240927.tar.gz
{% endblock %}

{% block go_sha %}
ccf39943c8ded49264f18de7e8ad096dbb5e8ea4a81fe98b2f6b2c409b7346f5
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block step_unpack %}
{{super()}}
cd cmd/gost
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gost ${out}/bin/
{% endblock %}
