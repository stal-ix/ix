{% extends 't/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/gi/repository/bootstrap/shim
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv lib tmp
mkdir lib
cp tmp/libgirepository-1.0.so lib/libgirepository-1.0.a
rm -rf tmp include
{% endblock %}
