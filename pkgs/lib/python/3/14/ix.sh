{% extends 't/ix.sh' %}

{% block bld_tool %}
bld/pip/scripts
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
llvm-ar qL ${out}/lib/libhacl.a Modules/_hacl/*.o
find ${out}/lib/python3.14/ -type f | while read l; do
    sed -e 's|.*Modules/_hacl/.*||g' -i ${l}
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
