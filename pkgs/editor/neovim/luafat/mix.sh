{% extends '//lib/lua/jit/mix.sh' %}

{% block bld_libs %}
lib/lua/modules/lpeg/mix.sh
lib/lua/modules/mpack/mix.sh
{{super()}}
{% endblock %}

{% block test_bin %}
#${out}/bin/lua* -e "require('lpeg')"
echo 'TODO'
{% endblock %}
