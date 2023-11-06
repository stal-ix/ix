{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/rsteube/carapace-bin/archive/refs/tags/v0.28.3.tar.gz
{% endblock %}

{% block go_sha %}
# can not fetch it
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/carapace
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp carapace ${out}/bin/
{% endblock %}
