{% extends '//lib/webkit/t/mix.sh' %}

{% block install %}
{{super()}}

cd ${out}/lib

rm -rf lib_webkit webkit2gtk*

for x in *.so; do
    cp ${x} $(echo ${x} | sed -e 's|.so|.a|')
done
{% endblock %}
