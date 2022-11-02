{% extends '//lib/placebo/t/ix.sh' %}

{% block fetch %}
https://github.com/haasn/libplacebo/archive/refs/tags/v5.229.1.tar.gz
sha:f861336cf789eebdf1ac0e8db5822cfff07eb96675ffcf84911ff6b1f431d309
{% endblock %}

{% block bld_libs %}
pip/glad2
{{super()}}
{% endblock %}
