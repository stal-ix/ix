{% extends '//mix/template/template.sh' %}

{% block fetch %}
# url https://downloads.sourceforge.net/project/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/unzip60.tar.gz
# md5 62b490407489521db863b523a7f86375
# url https://deb.debian.org/debian/pool/main/u/unzip/unzip_6.0-26.debian.tar.xz
# md5 e2bf7537e1ca821f6059ee84e7ae76a5
{% endblock %}

{% block bld_deps %}
env/std/0/mix.sh
{% endblock %}

{% block postunpack %}
cd ../unzip*
{% endblock %}

{% block patch %}
for i in ../debian/patches/*.patch; do
    cat "${i}" | patch -p1
done

for f in fileio.c list.c zipinfo.c; do
    (echo '#include <time.h>'; cat $f) > tmp && mv tmp $f
done
{% endblock %}

{% block build %}
make -f unix/Makefile macosx || true
{% endblock %}

{% block install %}
make prefix=${out} MANDIR=${out}/share/man/man1 -f unix/Makefile install
{% endblock %}
