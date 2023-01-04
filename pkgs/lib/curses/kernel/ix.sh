{% extends '//lib/ncurses/ix.sh' %}

{% block c_rename_symbol %}
{{super()}}
item_count
{% endblock %}
