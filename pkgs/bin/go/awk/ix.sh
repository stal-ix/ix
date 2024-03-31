{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/benhoyt/goawk/archive/refs/tags/v1.26.0.tar.gz
{% endblock %}

{% block go_sha %}
03b766d364698bfdf1f3e95a3f4c9b52ddb3e87d49540e7bc66225722b30e0dc
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp goawk ${out}/bin/
{% endblock %}
