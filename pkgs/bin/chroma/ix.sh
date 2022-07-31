{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/alecthomas/chroma/archive/refs/tags/v2.2.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:6870cb8c47897f2a75abaf3e6cbb160989b4e915b86fdcd9322fb17e073ccd81
{% endblock %}

{% block go_sha %}
sha:9067ab0fa6ec980d54fdda9d7bbdaff4e5e0206874265532be7b42ae1bc276c3
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/chroma
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp chroma ${out}/bin/
{% endblock %}
