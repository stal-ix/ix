{% extends 't/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/pip/scripts
{% endblock %}

{% block configure_flags %}
{{super()}}
{# Drop test modules from the install — both removes the freeze-only
   `__phello__.foo.py` file (handled defensively in py_exports too)
   and avoids listing lib2to3/tests/* whose test_*.py files import
   sibling fixtures from a tests/data/ dir that has no __init__.py,
   which makes freeze.py's modulefinder bail on `lib2to3.tests.data`.
   Available since CPython 3.10. 3/12+ already pass this. #}
--disable-test-modules
{% endblock %}

{% block install %}
{{super()}}
{# Generate the `exports` module list so freeze.sh embeds every .py
   under lib/python<X.Y>/ — including dynamically-imported names like
   `_sysconfigdata__linux_` that modulefinder can't trace from
   sysconfig._init_posix. Without this, frozen binaries (g-ir-scanner,
   etc.) abort at runtime with ModuleNotFoundError on workers that
   don't have lib/python in their fs. 3/12+ already do this in their
   own install. #}
{% if lib %}
cd ${out}/lib/python*
>__init__.py
py_exports > exports
cat exports
{% endif %}
{% endblock %}

{% block env %}
{{super()}}
{# freeze.sh's configure scans ${PYTHONPATH} for `exports` files; the
   py_exports written above only matters if our lib dir is on that
   path at consumer build time. Mirror what 3/12+ do in their env. #}
{% if lib %}
export PYTHONPATH="${out}/lib/python3.10:\${PYTHONPATH}"
{% endif %}
{% endblock %}
