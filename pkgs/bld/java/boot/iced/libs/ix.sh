{% extends '//bld/java/boot/iced/t/ix.sh' %}

{% block make_target %}
stamps/icedtea-boot.stamp
{% endblock %}

{% block install %}
cp -R ${tmp}/lib ${out}/
cp openjdk.build-boot/tmp/java/fdlibm/obj64/libfdlibm.amd64.a ${out}/lib/
{% endblock %}

{% block c_rename_symbol %}
scalbn
copysign
{% endblock %}
