{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/DominicBreuker/pspy/archive/refs/tags/v1.2.1.tar.gz
{% endblock %}

{% block go_sha %}
34977e0284afd516704bfea5881f83ec7eb07d31a7304d7ce819a008b30735a2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp pspy ${out}/bin/
{% endblock %}

