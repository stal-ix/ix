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
{{super()}}
cp -R ../dist/public ${out}/include
cd ${out}/lib
rm libssl3.a
mv libssl.a libssl3.a
rm libsoftokn3.a libsoftokn.a
mv libsoftokn_static.a libsoftokn3.a
rm libfreebl.a libfreebl3.a
mv libfreebl_static.a libfreebl3.a
mv libnss_static.a libnss3.a
mv libnsssysinit_static.a libnsssysinit.a
mv libpk11wrap_static.a libpk11wrap.a
mv libnssutil3.a libnssutil.a
rm libfreeblpriv3.a
rm libsmime3.a
{% endblock %}

{% block env %}
{{super()}}
export NSS_HEADERS=${out}/include/nss
{% endblock %}
