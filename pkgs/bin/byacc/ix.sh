{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://invisible-mirror.net/archives/byacc/byacc-20230521.tgz
sha:5ad915a7d5833aa38a5e31bd077505666029c35e365dff8569fe4598eaa9fef2
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
