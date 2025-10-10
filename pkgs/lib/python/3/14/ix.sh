{% extends 't/ix.sh' %}

{% block bld_tool %}
bld/pip/scripts
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cp Modules/_hacl/libH*.a ${out}/lib/
find ${out}/lib/python3.14/ -type f | while read l; do
    sed -e 's|Modules/_hacl/libHacl_Hash_SHA2.a||g' -i ${l}
done
cd ${out}/lib/python3.14
>__init__.py
py_exports > exports
cat exports
{% endblock %}

{% block env %}
{{super()}}
export PYTHONPATH="${out}/lib/python3.14:\${PYTHONPATH}"
{% endblock %}
