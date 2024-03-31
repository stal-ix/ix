{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/gopasspw/gopass/archive/refs/tags/v1.14.3.tar.gz
{% endblock %}

{% block go_sha %}
e82a085324332eac34e51c9e1eb115c4f8728b3144f137900935f5f72991c73a
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gopass ${out}/bin/
{% endblock %}
