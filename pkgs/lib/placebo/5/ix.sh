{% extends '//lib/placebo/t/ix.sh' %}

{% block fetch %}
https://github.com/haasn/libplacebo/archive/refs/tags/v5.264.0.tar.gz
sha:780e1c5d304a2c407b6709ac66e811bd1be03a769601f1dab41cf77c8519c668
{% endblock %}

{% block bld_libs %}
pip/glad2
{{super()}}
{% endblock %}
