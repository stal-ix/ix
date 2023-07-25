{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/gokcehan/lf/archive/refs/tags/r27.tar.gz
{% endblock %}

{% block go_sha %}
1b393151428afc5eed6953cc5f786443a3aedb9af1ba9d1833dc5e778cc80879
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp lf ${out}/bin/
{% endblock %}
