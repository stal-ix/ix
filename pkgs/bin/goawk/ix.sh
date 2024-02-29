{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/benhoyt/goawk/archive/refs/tags/v1.26.0.tar.gz
{% endblock %}

{% block go_sha %}
790bf24ad44cd90c1588ca9a0d9c61ffd61c329bb13939f06ba3a8d2ce93aee9
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp goawk ${out}/bin/
{% endblock %}
