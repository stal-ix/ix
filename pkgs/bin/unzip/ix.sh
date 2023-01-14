{% extends '//die/c/make.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/unzip60.tar.gz
sha:036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37
https://github.com/pg83/store/raw/main/unzip_6.0-27.debian.tar.xz
sha:67bde7c71d52afd61aa936d4415c8d12fd90ca26e9637a3cd67cae9b71298c12
{% endblock %}

{% block unpack %}
mkdir src; cd src
for x in ${src}/*; do
    extract 0 ${x}
done
cd unzip*
{% endblock %}

{% block cpp_missing %}
time.h
{% endblock %}

{% block patch %}
for i in ../debian/patches/*.patch; do
    cat "${i}" | patch -p1
done
{% endblock %}

{% block make_flags %}
-f unix/Makefile
MANDIR=${out}/share/man/man1
{% endblock %}

{% block make_target %}
macosx
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
