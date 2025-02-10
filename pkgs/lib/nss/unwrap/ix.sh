{% extends '//lib/nss/t/ix.sh' %}

{% block install %}
{{super()}}
rm ${out}/lib/*TOC ${out}/lib/*.so
cp -R ../dist/public ${out}/include
cd ${out}/lib
mv libfreebl_static.a libfreebl.a
mv libnss_static.a libnss.a
mv libnsssysinit_static.a libnsssysinit.a
mv libpk11wrap_static.a libpk11wrap.a
mv libsoftokn_static.a libsoftokn.a
cp ${tmp}/lib/libnssckbi.a ./
{% endblock %}

{% block env %}
{{super()}}
export NSS_HEADERS=${out}/include/nss
{% endblock %}
