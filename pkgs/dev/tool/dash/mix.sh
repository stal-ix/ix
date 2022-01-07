{% extends '//shell/cli/dash/mix.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block std_box %}
box/boot
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin; mv dash sh
{% endblock %}
