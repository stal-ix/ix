{% extends '//die/c/make.sh' %}

{% block fetch %}
https://git.sr.ht/~mcf/samurai/refs/download/1.2/samurai-1.2.tar.gz
sha:3b8cf51548dfc49b7efe035e191ff5e1963ebc4fe8f6064a5eefc5343eaf78a5
{% endblock %}

{% block c_rename_symbol %}
warn
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
