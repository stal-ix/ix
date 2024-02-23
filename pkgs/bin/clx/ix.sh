{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://github.com/bensadeh/circumflex/archive/refs/tags/3.5.tar.gz
{% endblock %}

{% block go_sha %}
82663cb2b1f634dcb0a18394d81975099f3a8d864d27ff5645f1f3e45ad69a22
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp clx ${out}/bin/
{% endblock %}

