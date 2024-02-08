{% extends '//lib/nss/t/ix.sh' %}

{% block libs %}
libfreebl
libfreeblpriv
libnss
libnssutil
libsmime
libsoftokn
libssl
{% endblock %}

{% block postinstall %}
rm ${out}/lib/*TOC ${out}/lib/*_static.a
{{super()}}
cp -R ../dist/public ${out}/include
{% for x in self.libs().split() %}
mv ${out}/lib/{{x}}3.a ${out}/lib/{{x}}.a
{% endfor %}
{% endblock %}

{% block env %}
{{super()}}
export NSS_HEADERS=${out}/include/nss
{% endblock %}
