{% extends '//die/go/c.sh' %}

{% block fetch %}
https://github.com/rs/curlie/archive/refs/tags/v1.6.9.tar.gz
sha:95b7061861aa8d608f9df0d63a11206f8cd532295ca13dd39ed37e0136bdcc5f
{% endblock %}

{% block bld_libs %}
lib/curl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp curlie ${out}/bin/
{% endblock %}
