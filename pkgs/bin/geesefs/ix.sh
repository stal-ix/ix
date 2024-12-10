{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/yandex-cloud/geesefs/archive/refs/tags/v0.42.3.tar.gz
{% endblock %}

{% block go_sha %}
3837b3cf26b60df1825b1c1330b0c68427cc00becff9134972d6eb27bee87b8b
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp geesefs ${out}/bin/
{% endblock %}
