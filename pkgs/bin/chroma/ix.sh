{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/alecthomas/chroma/archive/refs/tags/v2.5.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:ad0bce3d6ba4397a866e5c8728c146fb370a2b0adb1d35fccdf7d515a9c7f553
{% endblock %}

{% block go_sha %}
sha:9dddebc23f50cbc1c101e99448692e84f0e037bf136e9c19f578450e671d6f5e
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/chroma
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp chroma ${out}/bin/
{% endblock %}
