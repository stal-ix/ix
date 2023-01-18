{% extends '//bin/gdb/t/ix.sh' %}

{% block patch %}
{{super()}}
sed -e 's|return rl_completer_word_break_characters|return (char*)rl_completer_word_break_characters|' -i gdb/completer.c
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}
