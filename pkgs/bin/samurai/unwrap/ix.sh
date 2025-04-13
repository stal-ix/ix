{% extends '//die/c/make.sh' %}

{% block version %}
1.2
{% endblock %}

{% block fetch %}
https://git.sr.ht/~mcf/samurai/refs/download/{{self.version().strip()}}/samurai-{{self.version().strip()}}.tar.gz
sha:3b8cf51548dfc49b7efe035e191ff5e1963ebc4fe8f6064a5eefc5343eaf78a5
{% endblock %}

{% block c_rename_symbol %}
warn
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
