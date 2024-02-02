{% extends '//bin/gdb/t/ix.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/gdb/gdb-11.2.tar.xz
sha:1497c36a71881b8671a9a84a0ee40faab788ca30d7ba19d8463c3cc787152e32
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|return rl_completer_word_break_characters|return (char*)rl_completer_word_break_characters|' -i gdb/completer.c
{% endblock %}
