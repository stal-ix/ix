{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/unzip60.tar.gz
62b490407489521db863b523a7f86375
https://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-26.debian.tar.xz
e2bf7537e1ca821f6059ee84e7ae76a5
{% endblock %}

{% block bld_tool %}
bin/patch
{% endblock %}

{% block std_box %}
bin/bootbox
{% endblock %}

{% block unpack_chdir %}
cd unzip*
{% endblock %}

{% block patch %}
for i in ../debian/patches/*.patch; do
    cat "${i}" | patch -p1
done

for f in fileio.c list.c zipinfo.c; do
    (echo '#include <time.h>'; cat ${f}) > _ && mv _ ${f}
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
