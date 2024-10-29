{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/yandex-cloud/geesefs/archive/ad455fd2b4e820f4d9becad4faf9fafeb29b8f2a.zip
{% endblock %}

{% block go_sha %}
09e7226ddcd1d1b2084fdd94cf875736ff519dbce5aa403714e10ab0f91db58a
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp geesefs ${out}/bin/
{% endblock %}
