{% extends '//bin/gdb/t/ix.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/gdb/gdb-10.2.tar.xz
sha:aaa1223d534c9b700a8bec952d9748ee1977513f178727e1bee520ee000b4f29
{% endblock %}

{% block patch %}
{{super()}}
find -name completer.c | while read l; do
    sed -e 's|return rl_completer_word_break_characters|return (char*)rl_completer_word_break_characters|' -i ${l}
done
{% endblock %}
