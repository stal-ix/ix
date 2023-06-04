{% extends '//bin/grep/t/ix.sh' %}

{% block patch %}
{{super()}}
sed -e 's|getprogname ()|"grep"|' -i src/grep.c
{% endblock %}

{% block install %}
{{super()}}
rm  ${out}/bin/egrep ${out}/bin/fgrep
{% endblock%}
