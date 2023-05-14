{% extends '//lib/lua/puc/5/2/ix.sh' %}

{% block bld_libs %}
lib/lua/modules/lpeg
lib/lua/modules/mpack
lib/lua/modules/bitop
{{super()}}
{% endblock %}
