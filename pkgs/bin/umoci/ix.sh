{% extends '//die/go/c.sh' %}

{% block fetch %}
https://github.com/opencontainers/umoci/archive/refs/tags/v0.4.7.tar.gz
sha:c01b36de6fdc513eb65add57bc882d72f94fc3b4b65a8f9ef59826fb754af93e
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/umoci
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp umoci ${out}/bin/
{% endblock %}
