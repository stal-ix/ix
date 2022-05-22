{% extends '//bin/telegram/desktop/unwrap/t/ix.sh' %}

{% block ninja_threads %}5{% endblock %}

{% block cpp_includes %}
{{super()}}
${GCC_INCLUDES}
{% endblock %}

{% block setup %}
{{super()}}
export LDFLAGS=$(echo ${LDFLAGS} | sed -e 's|-nostdlib++|-nostdlib|')
{% endblock %}

{% block c_compiler %}
bin/gcc(for_target={{target.gnu.three}})
{% endblock %}
