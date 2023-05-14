{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/benhoyt/goawk/archive/refs/tags/v1.23.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:56467fe10d184ffaaf47fff7ede29c85be53af8b65c158bf5cab259a0de0a527
{% endblock %}

{% block go_sha %}
sha:db0691a13a0a17337627c42067ba8ce4c5d32910c97089a2510933da4605742b
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp goawk ${out}/bin/
{% endblock %}
