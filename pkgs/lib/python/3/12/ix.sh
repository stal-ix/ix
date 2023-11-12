{% extends 't/ix.sh' %}

{% block lib_deps %}
{% if purec %}
lib/dlfcn
{% endif %}
{{super()}}
{% endblock %}

{% block bld_tool %}
bld/python/12
bld/pip/scripts
bld/fake/er(tool_name=ld)
{{super()}}
{% endblock %}

{% block configure_flags %}
--disable-test-modules
--with-build-python=${NATIVE_PYTHON}
{{super()}}
{% endblock %}

{% block patch %}
sed -e 's|MACHDEP=.*unknown.*|:|' \
    -e 's|.*ERROR.*cross build not.*||' \
    -i configure.ac
{{super()}}
{% endblock %}

{% block configure %}
export READELF=llvm-readelf
export MACHDEP={{target.os}}
export ac_cv_file__dev_ptc=no
export ac_cv_file__dev_ptmx=yes
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
{% if lib %}
cp Modules/_hacl/libH*.a ${out}/lib/
find ${out}/lib/python3.12/ -type f | while read l; do
    sed -e 's|Modules/_hacl/libHacl_Hash_SHA2.a||g' -i ${l}
done
cd ${out}/lib/python3.12
py_exports > exports
cat exports
{% endif %}
{% endblock %}

{% block env %}
{{super()}}
export PYTHONPATH="${out}/lib/python3.12:\${PYTHONPATH}"
{% endblock %}
