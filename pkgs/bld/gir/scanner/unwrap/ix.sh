{% extends '//die/python/bin.sh' %}

{% block bld_libs %}
lib/gi/repository/py/register
{{super()}}
{% endblock %}

{% block entry_point %}g-ir-scanner-bin{% endblock %}

{% block step_unpack %}
export PY_ENTRY_FILE=$(source_env "${IX_T_DIR}"; echo ${PY_ENTRY_FILE})
cat - ${PY_ENTRY_FILE} << EOF > g-ir-scanner-bin
__file__ = "${out}/bin/g-ir-scanner-bin"
import sys
import _giscanner
sys.modules['giscanner._giscanner'] = _giscanner
def flt():
    for x in sys.argv:
        if x.startswith('--doc-format'):
            pass
        else:
            yield x
sys.argv = list(flt())
EOF
{% endblock %}

{% block install %}
{{super()}}
{# g-ir-scanner-bin resolves DATADIR by `os.path.dirname(__file__) +
   '/../share'`, falling back to a build-time-baked absolute path
   into lib-gi-repository-py only if the relative dir lacks gir-1.0.
   That fallback uid isn't on a clean gorn worker — lib-gi-repository-py
   isn't a transitive dep of scanner consumers — so the fallback
   404s and the scanner aborts on `Couldn't find ... gdump.c`.
   Bundle the share/ tree here so the relative resolution wins and
   scanner-unwrap stays self-contained. PY_ENTRY_FILE points at
   <lib-gi-repository-py>/lib/giscanner/g-ir-scanner — three
   dirnames up gets us the package root. #}
LIB_GI_PY=$(dirname $(dirname $(dirname ${PY_ENTRY_FILE})))
mkdir -p ${out}/share
cp -rL ${LIB_GI_PY}/share/gobject-introspection-1.0 ${out}/share/
cp -rL ${LIB_GI_PY}/share/gir-1.0 ${out}/share/
{% endblock %}
