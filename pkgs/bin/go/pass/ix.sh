{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/gopasspw/gopass/archive/refs/tags/v1.14.3.tar.gz
{% endblock %}

{% block go_sha %}
08d1c2b3c064fd36c41bd896e871bef58903e84fd218606de545a16bc5602427
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gopass ${out}/bin/
{% endblock %}
