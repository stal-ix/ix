{% extends '//lib/webkit/t/mix.sh' %}

{% block install %}
{{super()}}

cd ${out}/lib

rm -rf lib_webkit webkit2gtk*

#find ${tmp}/obj -type f | grep '\.a' | while read l; do
#    cp ${l} ./
#done

for x in *.so; do
    cp ${x} $(echo ${x} | sed -e 's|.so|.a|')
done
{% endblock %}
