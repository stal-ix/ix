{% extends '//lib/zstd/t/t/ix.sh' %}

{% block version %}
1.5.6
{% endblock %}

{% block fetch %}
{{super()}}
sha:30f35f71c1203369dc979ecde0400ffea93c27391bfd2ac5a9715d2173d92ff7
{% endblock %}

{% block build_flags %}
{{super()}}
fix_shebangs
{% endblock %}
