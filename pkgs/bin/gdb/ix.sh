{% extends '//bin/gdb/t/ix.sh' %}

{% block host_libs %}
lib/c
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|return rl_completer_word_break_characters|return (char*)rl_completer_word_break_characters|' -i gdb/completer.c
{% endblock %}
