{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
LibRaw
{% endblock %}

{% block version %}
0.22.0
{% endblock %}

{% block fetch %}
https://github.com/LibRaw/LibRaw/archive/refs/tags/{{self.version().strip()}}.tar.gz
5a11327a9cef2496d6a4335e8da30a1604460b6c545a30fe7588cf4c00a0fcae
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
