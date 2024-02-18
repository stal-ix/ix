{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/bensadeh/circumflex/archive/refs/tags/3.5.tar.gz
{% endblock %}

{% block go_sha %}
4a69b5d7caf96a27367eb9867eba0d8562f5628a68130d8b7ddd401868acdb9a
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp clx ${out}/bin/
{% endblock %}

