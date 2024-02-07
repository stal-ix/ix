{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/benhoyt/goawk/archive/refs/tags/v1.25.0.tar.gz
{% endblock %}

{% block go_sha %}
a2831b0f1114325eb37b7f1a4572c1c27dc3aad3c1964742cdf29afbe90c7b2f
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp goawk ${out}/bin/
{% endblock %}
