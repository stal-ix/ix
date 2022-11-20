{% extends '//lib/nss/t/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/scripts/genpc
{% endblock %}

{% block install %}
{{super()}}
mkdir ${out}/include
cp -R ../dist/public/* ${out}/include/
cd ${out}/lib
rm *.TOC *_static.a
for x in *.so; do
    mv ${x} $(echo ${x} | sed -e 's|3.so|.a|' | sed -e 's|.so|.a|')
done
genpc "nss" "3.66"
{% endblock %}
