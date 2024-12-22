{% extends '//bld/python/2/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/expat/dl
bin/pypy/externmod/dl
{% endblock %}

{% block patch %}
{{super()}}
cat << EOF >> Modules/Setup.local
_ctypes _ctypes/_ctypes.c _ctypes/callbacks.c _ctypes/callproc.c _ctypes/stgdict.c _ctypes/cfield.c
pyexpat expat/xmlparse.c expat/xmlrole.c expat/xmltok.c pyexpat.c
EOF
{% endblock %}

{% block cpp_defines %}
{{super()}}
HAVE_EXPAT_CONFIG_H=1
XML_POOR_ENTROPY=1
USE_PYEXPAT_CAPI=1
{% endblock %}

{% block c_rename_symbol %}
{{super()}}
_INTERNAL_trim_to_complete_utf8_characters
{% endblock %}
