{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/rsteube/carapace-bin/archive/refs/tags/v0.29.1.tar.gz
{% endblock %}

{% block go_sha %}
d24bf8474e1e50d2d31c206564eb5d14bbbd45a471041fe5b359416809e7e17c
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/carapace
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp carapace ${out}/bin/
{% endblock %}
