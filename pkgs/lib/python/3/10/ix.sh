{% extends 't/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/pip/scripts
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
