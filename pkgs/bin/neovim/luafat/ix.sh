{% extends '//lib/lua/jit/ix.sh' %}

{% block bld_libs %}
lib/lua/modules/lpeg
lib/lua/modules/mpack
{{super()}}
{% endblock %}
