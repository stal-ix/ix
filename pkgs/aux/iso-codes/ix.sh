{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://deb.debian.org/debian/pool/main/i/iso-codes/iso-codes_4.11.0.orig.tar.xz
sha:de556503c7cfd33e08b5c1ced4902e82bb3c5137a076930a9c9da687d9146938
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block strip_pc %}
:
{% endblock %}
