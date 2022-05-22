{% extends '//lib/alsa/t/ix.sh' %}

{% block install %}
{{super()}}
rm -r ${out}/share/aclocal
{% endblock %}

{% block env %}
export ALSA_LIB_DATA="${out}"
{% endblock %}
