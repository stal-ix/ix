{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/alecthomas/chroma/archive/refs/tags/v2.2.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:6870cb8c47897f2a75abaf3e6cbb160989b4e915b86fdcd9322fb17e073ccd81
{% endblock %}

{% block go_sha %}
sha:b45ddb93e968fb7bd865710ce1c6fe8c33625c504c940c463a9a0e962db5c345
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/chroma
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp chroma ${out}/bin/
{% endblock %}
