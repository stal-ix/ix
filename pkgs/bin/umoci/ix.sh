{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/opencontainers/umoci/archive/refs/tags/v0.4.7.tar.gz
{% endblock %}

{% block go_sum %}
sha:c01b36de6fdc513eb65add57bc882d72f94fc3b4b65a8f9ef59826fb754af93e
{% endblock %}

{% block go_sha %}
sha:3d00f649bcd7ffc97c6a16d765e5dfc157bf90361ef18ca309dec0812e075657
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/umoci
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp umoci ${out}/bin/
{% endblock %}
