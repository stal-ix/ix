{% extends '//bin/mdns/responder/t/ix.sh' %}

{% block make_flags %}
{{super()}}
ETCBASE=${out}/etc
INSTBASE=${out}
MANPATH=${out}/man
STARTUPSCRIPTDIR=${out}/share/mdns
RUNLEVELSCRIPTSDIR=
OPTINSTALL=
{% endblock %}

{% block patch %}
{{super()}}
>-lmbedtls
>-lmbedcrypto
{% endblock %}
