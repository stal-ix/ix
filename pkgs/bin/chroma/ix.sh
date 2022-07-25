{% extends '//die/go/c.sh' %}

{% block fetch %}
https://github.com/alecthomas/chroma/archive/refs/tags/v2.2.0.tar.gz
sha:6870cb8c47897f2a75abaf3e6cbb160989b4e915b86fdcd9322fb17e073ccd81
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/chroma
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp chroma ${out}/bin/
{% endblock %}
