{% extends '//lib/webkit/t/mix.sh' %}

{% block install %}
{{super()}}

cd ${out}/lib

rm -rf lib_webkit webkit2gtk*

for x in *.so; do
    cp ${x} $(echo ${x} | sed -e 's|.so|.a|')
done
{% endblock %}

{% block env_lib %}
{{super()}}
export CPPFLAGS="-I${out}/include/webkitgtk-5.0 -I${out}/include/webkitgtk-4.1 \${CPPFLAGS}"
{% endblock %}
