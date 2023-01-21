{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/LibRaw/LibRaw/archive/refs/tags/0.21.1.tar.gz
sha:b63d7ffa43463f74afcc02f9083048c231349b41cc9255dec0840cf8a67b52e0
{% endblock %}

{% block lib_deps %}
lib/c
lib/jasper
lib/lcms/2
{% endblock %}

{% block install %}
{{super()}}
for x in ${out}/lib/pkgconfig/*.pc; do
    sed -e 's|-lstdc++||g' -i ${x}
done
{% endblock %}

{% block test %}
cat ${out}/lib/pkgconfig/* | grep 'stdc' | while read l; do
    echo 'FIX libstdc++'
    exit 1
done
{% endblock %}
