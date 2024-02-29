{% extends 't/ix.sh' %}

{% block bld_libs %}
{{super()}}
bin/mdns/responder/lib
{% endblock %}

{% block make_flags %}
{{super()}}
ETCBASE=${out}/etc
INSTBASE=${out}
MANPATH=${out}/man
STARTUPSCRIPTDIR=${out}/share/mdns
RUNLEVELSCRIPTSDIR=
OPTINSTALL=
{% endblock %}

{% block install %}
mkdir -p ${out}/share/mdns ${out}/sbin ${out}/bin ${out}/lib ${out}/include ${out}/man/man8
{{super()}}
mv ${out}/sbin/* ${out}/bin/
rm -rf ${out}/sbin
{% endblock %}
