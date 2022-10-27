{% extends '//lib/placebo/t/ix.sh' %}

{% block fetch %}
https://github.com/haasn/libplacebo/archive/refs/tags/v5.229.0.tar.gz
sha:919b4dbe4204bd9d74c5b1ce06910d11ecac94676ed44c38cd0745f07a33bfa2
{% endblock %}

{% block bld_libs %}
pip/glad2
{{super()}}
{% endblock %}
