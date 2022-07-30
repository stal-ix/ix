{% extends '//lib/archive/lite/ix.sh' %}

{% block build_flags %}
compress
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
rm bin/bsdcat
rm bin/bsdcpio
mv bin old
mkdir bin
mv old bin/bin_ix
{% endblock %}
