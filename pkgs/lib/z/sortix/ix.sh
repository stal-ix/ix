{% extends '//lib/z/adler/t/ix.sh' %}

{% block pkg_name %}
libz
{% endblock %}

{% block version %}
1.2.8.2015.12.26
{% endblock %}

{% block fetch %}
https://sortix.org/libz/release/libz-{{self.version().strip()}}.tar.gz
abcc2831b7a0e891d0875fa852e9b9510b420d843d3d20aad010f65493fe4f7b
{% endblock %}

{% block configure %}
sh ./configure --prefix=${out} --enable-static --disable-shared
{% endblock %}
