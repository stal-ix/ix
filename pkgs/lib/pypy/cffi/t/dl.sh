{# Registers a cffi module's entry point under the name dlopen()
   reduces its stub file's path to: basename, no lib prefix, cut at
   the first dot -- so _pwdgrp_cffi.pypy312-pp80-.so becomes
   _pwdgrp_cffi. #}

{% extends '//die/dl/fix.sh' %}

{% block export_symbols %}
_cffi_pypyinit_{{self.cffi_module().strip()}}
{% endblock %}

{% block export_lib %}
{{self.cffi_module().strip()}}
{% endblock %}

{# the archive's symbols carry the module name in front of them, so
   that two modules from one cdef do not collide; the registered name
   stays the one cpyext looks up #}
{% block export_prefix %}
{{self.cffi_module().strip()}}_
{% endblock %}
