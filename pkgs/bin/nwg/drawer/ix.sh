{% extends '//bin/nwg/t/ix.sh' %}

{% block go_url %}
https://github.com/nwg-piotr/nwg-drawer/archive/refs/tags/v0.5.0.tar.gz
{% endblock %}

{% block go_sha %}
b12e9209af5dad2061b22085d42e7417ff1e031d93c87461d7e2edf4bd3b9965
{% endblock %}

{% block go_tool %}
bin/go/lang/22
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nwg-drawer ${out}/bin/
{% endblock %}
