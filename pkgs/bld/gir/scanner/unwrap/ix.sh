{% extends '//die/python/bin.sh' %}

{% block step_unpack %}
:
{% endblock %}

{% block bld_libs %}
lib/glib/dl
lib/gi/repository/py/register
{{super()}}
{% endblock %}

{% block entry_point %}g-ir-scanner{% endblock %}

{% block build %}
cat - ${PY_ENTRY_FILE} << EOF > g-ir-scanner
__file__ = "${out}/bin/g-ir-scanner"
import sys
import _giscanner
sys.modules['giscanner._giscanner'] = _giscanner
EOF
{{super()}}
{% endblock %}
