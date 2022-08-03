{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/rs/curlie/archive/refs/tags/v1.6.9.tar.gz
{% endblock %}

{% block go_sum %}
sha:95b7061861aa8d608f9df0d63a11206f8cd532295ca13dd39ed37e0136bdcc5f
{% endblock %}

{% block go_sha %}
sha:2ec7ef94d6863cfc34f5120693a377128080dde1c6a4693c9e5f628e3114b6a6
{% endblock %}

{% block patch %}
rm curlie
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp curlie ${out}/bin/
{% endblock %}
