{% extends '//bin/yash/t/ix.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block configure %}
sh configure --prefix="${out}" --disable-lineedit
{% endblock %}
