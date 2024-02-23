{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://github.com/ipfs/ipget/archive/refs/tags/v0.10.0.tar.gz
{% endblock %}

{% block go_sha %}
e5832cc3c1485fa0b14bbb89fd2e40d2c356fd5f3f8a30865d91195a23892be2
{% endblock %}

{% block go_compiler %}
bin/go/20
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ipget ${out}/bin/
{% endblock %}
