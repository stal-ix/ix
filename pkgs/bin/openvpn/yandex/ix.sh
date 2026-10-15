{# Yandex's Ubuntu client supplies dns-srv and yandex-client. Bundle only
   its ELF: solo supplies the libc/resolver ABI over musl, and the stub
   serves its other DT_NEEDED libraries from ix's own static builds through
   lib/<name>/dl providers. The vendor's package scripts, glibc, Ubuntu
   libraries and system services are not installed. #}

{% extends '//die/gen.sh' %}

{% block pkg_name %}
openvpn-yandex
{% endblock %}

{% block version %}
2.6.12-ya
{% endblock %}

{% block fetch %}
{% if not linux or not x86_64 %}
{{ix.error('The Yandex OpenVPN binary is only available for Linux x86_64')}}
{% endif %}
https://download.yandex.ru/hd/vpn/openvpn_{{self.version().strip()}}_22.04_amd64.deb
fabea1b8bd6cb5d64ca2ffb23800000663a040c8323e10a9b2be1e16da2cfcbc
{% endblock %}

{% block lib_deps %}
bin/openvpn/yandex/stub(kind=bin,libdlfcn_ver=solo,libc_lite=)
{% endblock %}

{% block bld_tool %}
bin/solo/pack
bld/tar
bld/zstd
{% endblock %}

{% block install %}
mkdir -p root ${out}/bin ${out}/share/licenses/openvpn-yandex
for deb in ${src}/*.deb; do
    archive="$(basename "${deb}" .deb)"
    mkdir -p "${archive}"
    bsdtar -xf "${deb}" -C "${archive}"
    bsdtar -xf "${archive}"/data.tar.* -C root
done

solo-pack --stub ${OPENVPN_YANDEX_SOLO_STUB} \
    --program openvpn=root/usr/sbin/openvpn \
    --output ${out}/bin/openvpn-yandex --check

cp root/usr/share/doc/openvpn/copyright ${out}/share/licenses/openvpn-yandex/openvpn
{% endblock %}
