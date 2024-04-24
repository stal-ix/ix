{% extends 't/ix.sh' %}

{% block configure_flags %}
{{super()}}
--enable-libuuid
--enable-libuuid-force-uuidd
--enable-libblkid
--enable-libmount
--enable-libsmartcols
--without-cap-ng
--without-libz
--without-libmagic
--disable-all-programs
{% endblock %}
