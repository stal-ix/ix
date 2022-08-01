{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/alecthomas/chroma/archive/refs/tags/v2.2.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:6870cb8c47897f2a75abaf3e6cbb160989b4e915b86fdcd9322fb17e073ccd81
{% endblock %}

{% block go_sha %}
sha:8aa894c7370e9a1f93cbe719071599cd0d8201c1d50fe1e915e49fb45d45a47d
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/chroma
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp chroma ${out}/bin/
{% endblock %}
