{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/yandex-cloud/geesefs/archive/refs/tags/v0.42.1.tar.gz
{% endblock %}

{% block go_sha %}
a60582f2d1f31d1d68708d555b3d7d47aed19e5636507ca149d4413458662637
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp geesefs ${out}/bin/
{% endblock %}
