{% extends '//die/c/make.sh' %}

{% block pkg_name %}
samurai
{% endblock %}

{% block version %}
1.3
{% endblock %}

{% block fetch %}
https://git.sr.ht/~mcf/samurai/refs/download/{{self.version().strip()}}/samurai-{{self.version().strip()}}.tar.gz
1bc020a9e133432df51911ac71cc34322f828934d9a2282ba2916d88c15976af
{% endblock %}

{% block c_rename_symbol %}
warn
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
