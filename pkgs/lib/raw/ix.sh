{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/LibRaw/LibRaw/archive/refs/tags/0.21.2.tar.gz
sha:7ac056e0d9e814d808f6973a950bbf45e71b53283eed07a7ea87117a6c0ced96
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
