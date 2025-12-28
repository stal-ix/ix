{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
LibRaw
{% endblock %}

{% block version %}
0.21.5
{% endblock %}

{% block fetch %}
https://github.com/LibRaw/LibRaw/archive/refs/tags/{{self.version().strip()}}.tar.gz
4b7f183a68f6e46e579e80ba32ab121687e75bd30a2e5566f34c36a6bcba1679
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
