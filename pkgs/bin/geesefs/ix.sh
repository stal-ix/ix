{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/yandex-cloud/geesefs/archive/refs/tags/v0.42.4.tar.gz
{% endblock %}

{% block go_sha %}
b78420edf5880ddf1b2ee1b49f752b9d433fcf2f9e9397a9a7ec850009d82d1d
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp geesefs ${out}/bin/
{% endblock %}
