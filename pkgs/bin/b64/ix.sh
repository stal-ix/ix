{% extends '//die/c/ix.sh' %}

{% block fetch %}
http://base64.sourceforge.net/b64.c
sha:539a31521e4ef51661ab4602bead39a77cecf459cb25915cf22dd2f171ed97bc
{% endblock %}

{% block unpack %}
:
{% endblock %}

{% block build %}
${CC} ${src}/b64.c -o base64
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp base64{{target.exe_suffix}} ${out}/bin
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
