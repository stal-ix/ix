{% extends '//bin/zathura/t/ix.sh' %}

{% block fetch %}
https://git.pwmt.org/pwmt/zathura-ps/-/archive/0.2.7/zathura-ps-0.2.7.tar.bz2
sha:8c66733b121ec9df91c8860336535bfe5299a9ab7412af3c3990bdb2150c95f8
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/spectre
{% endblock %}
