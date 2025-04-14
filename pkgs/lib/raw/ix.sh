{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
LibRaw
{% endblock %}

{% block version %}
0.21.4
{% endblock %}

{% block fetch %}
https://github.com/LibRaw/LibRaw/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:8baeb5253c746441fadad62e9c5c43ff4e414e41b0c45d6dcabccb542b2dff4b
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
