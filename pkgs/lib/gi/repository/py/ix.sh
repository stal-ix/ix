{% extends '//lib/gi/repository/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}
mv lib tmp
mkdir lib
mv tmp/gobject-introspection/giscanner/_giscanner.cpython-310-x86_64-linux-gnu.so lib/lib_giscanner.a
cp tmp/libgirepository-1.0.so lib/libgirepository-1.0.a
mv tmp/gobject-introspection/giscanner lib/
rm -rf lib/giscanner/doctemplates
rm -rf tmp include
{% endblock %}

{% block postinstall %}
{{super()}}
rm -rf ${out}/lib/aux
{% endblock %}

{% block env %}
export PYTHONPATH="${out}/lib:\${PYTHONPATH}"
{% endblock %}
