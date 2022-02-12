{% extends '//mix/proxy.sh' %}

{% block bld_libs %}
lib/webkit
{% endblock %}

{% block install %}
cd ${out}; mkdir bin; cd bin

find ${lib_webkit} -type f -executable | while read l; do
    cp "${l}" ./
done

rm jsc
{% endblock %}
