{% extends '//bin/tmux/stock/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/shim/ix
{% endblock %}

{% block cpp_missing %}
{{super()}}
ix.h
{% endblock %}

{% block cpp_defines %}
{{super()}}
TMUX_SOCK=ix_temp_dir\(\)
{% endblock %}
