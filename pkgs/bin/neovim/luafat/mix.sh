{% extends '//lib/lua/jit/mix.sh' %}

{% block bld_libs %}
lib/lua/modules/lpeg
lib/lua/modules/mpack
{{super()}}
{% endblock %}
