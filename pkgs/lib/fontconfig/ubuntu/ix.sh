{% extends '//lib/fontconfig/stock/ix.sh' %}

{% block fetch %}
https://launchpad.net/ubuntu/+archive/primary/+files/fontconfig_2.13.1-4.4ubuntu1.debian.tar.xz
sha:8ce55d192e0b6f5dff1bbf244b2afd7cae332e9d6260963b4a218f217ef40a33
https://launchpad.net/ubuntu/+archive/primary/+files/fontconfig_2.13.1.orig.tar.bz2
sha:f655dd2a986d7aa97e052261b36aa67b0a64989496361eca8d604e6414006741
{% endblock %}

{% block unpack %}
mkdir src; cd src
extract 0 ${src}/*bz2
extract 0 ${src}/*xz
cd font*
{% endblock %}

{% block patch %}
{{super()}}
cat ../debian/patches/series | while read l; do
    echo "apply ${l}"
    patch -p1 < ../debian/patches/${l}
done
{% endblock %}
