{% extends '//lib/gi/repository/bootstrap/t/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}
mv lib tmp
mkdir lib
mv tmp/gobject-introspection/giscanner/_giscanner.cpython-310-x86_64-linux-gnu.so lib/lib_giscanner.a
cp tmp/libgirepository-1.0.so lib/libgirepository-1.0.a
mv tmp/gobject-introspection/giscanner lib/
mv bin/g-ir-scanner lib/giscanner/g-ir-scanner
cat << EOF >> lib/giscanner/shlibs.py
def resolve_shlibs(options, binary, libraries):
    return libraries
EOF
rm -rf lib/giscanner/doctemplates
rm -rf tmp include
find lib/ -type f -name '*.py' | sed -e 's|lib/||' | sed -e 's|\.py||' | sed -e 's|\/|\.|' > lib/exports
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export PY_ENTRY_FILE=${out}/lib/giscanner/g-ir-scanner
export PYTHONPATH="${out}/lib:\${PYTHONPATH}"
{% endblock %}
