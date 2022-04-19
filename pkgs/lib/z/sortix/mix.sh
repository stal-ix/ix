{% extends '//lib/z/adler/mix.sh' %}

{% block fetch %}
https://sortix.org/libz/release/libz-1.2.8.2015.12.26.tar.gz
sha:abcc2831b7a0e891d0875fa852e9b9510b420d843d3d20aad010f65493fe4f7b
{% endblock %}

{% block configure %}
sh ./configure --prefix=${out} --enable-static --disable-shared
{% endblock %}
