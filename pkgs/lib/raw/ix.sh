{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
LibRaw
{% endblock %}

{% block version %}
0.21.3
{% endblock %}

{% block fetch %}
https://github.com/LibRaw/LibRaw/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:dc3d8b54e333d9d5441336049db255d14b27f19bd326a306cf5aea866806780a
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
