{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
LibRaw
{% endblock %}

{% block version %}
0.22.3
{% endblock %}

{% block fetch %}
https://github.com/LibRaw/LibRaw/archive/refs/tags/{{self.version().strip()}}.tar.gz
7edf96c5b70cff88980a02ab0fc8af125cb6a4a377985573c654439d9d02355c
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
