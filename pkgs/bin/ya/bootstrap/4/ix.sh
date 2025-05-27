{% extends '//bin/ya/bootstrap/t/ix.sh' %}

{% block git_commit %}
6fa5fbe3ff0a4979001cb317f0d1a022a953d63c
{% endblock %}

{% block git_sha %}
3e6fc28ca1eee6c199c89dd93bdf4468f460b55e8b5a5a46bcd1d59999d3ee4d
{% endblock %}

{% block bld_tool %}
bin/gg
bin/ya/bootstrap/3(clang_ver=18)
{{super()}}
{% endblock %}
