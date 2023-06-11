{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/benhoyt/goawk/archive/refs/tags/v1.23.3.tar.gz
{% endblock %}

{% block go_sum %}
sha:ad9c8431d0a0976445f47015e263b3b2ec05cc4c17703fa8d2b02e3242daef08
{% endblock %}

{% block go_sha %}
sha:cde0ecc1783bc1c15a3f10604c01ee21d1af79fa4962352955e21bc193981d24
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp goawk ${out}/bin/
{% endblock %}
