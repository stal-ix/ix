{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/benhoyt/goawk/archive/refs/tags/v1.23.2.tar.gz
{% endblock %}

{% block go_sum %}
sha:f4613343fa6d43866da5e34d5bd8fc72275907a4c45f64ed63fcc800b4f358c3
{% endblock %}

{% block go_sha %}
sha:e9ee5590c3b1300dcc7b08491dfdb77bc4b16929cf740a6d7fa14a58c48c6a8d
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp goawk ${out}/bin/
{% endblock %}
