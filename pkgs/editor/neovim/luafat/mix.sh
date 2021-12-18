{% extends '//lib/lua/puc/mix.sh' %}

{% block bld_libs %}
lib/lua/modules/lpeg/mix.sh
lib/lua/modules/bitop/mix.sh
lib/lua/modules/mpack/mix.sh
{{super()}}
{% endblock %}
