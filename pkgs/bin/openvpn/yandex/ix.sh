{# Yandex's Ubuntu client supplies dns-srv and yandex-client. Bundle only
   its ELF and required DSOs; solo supplies the libc/resolver ABI over musl.
   The vendor's package scripts, glibc and system services are not installed. #}

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
https://archive.ubuntu.com/ubuntu/pool/main/libc/libcap-ng/libcap-ng0_0.7.9-2.2build3_amd64.deb
124d0c8748a841f279e996298ef8aac69a249e294792f4b5e16dc00496f1d3ac
https://archive.ubuntu.com/ubuntu/pool/main/l/lz4/liblz4-1_1.9.3-2build2_amd64.deb
ac9b54d0feb840345060c74fb687675c5e1eb2b195effafae38c5f9991041e98
https://archive.ubuntu.com/ubuntu/pool/main/l/lzo2/liblzo2-2_2.10-2build3_amd64.deb
98f621d5eb3052a2468473dc3f00ac3ee451a62b85d85480575f694a5205117d
https://archive.ubuntu.com/ubuntu/pool/main/p/pkcs11-helper/libpkcs11-helper1_1.28-1_amd64.deb
dd228f8c8498c45dd883e4574092ed840610d6dce517cf5ab00b5439869fa072
https://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl3_3.0.2-0ubuntu1.30_amd64.deb
d1b4636e32ac6d3b95d583ac05ac548b1aa248414bae1c51b14f54be0f8fd7bc
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
    --library root/lib/x86_64-linux-gnu/libcap-ng.so.0 \
    --library root/lib/x86_64-linux-gnu/liblzo2.so.2 \
    --library root/usr/lib/x86_64-linux-gnu/liblz4.so.1 \
    --library root/usr/lib/x86_64-linux-gnu/libpkcs11-helper.so.1 \
    --library root/usr/lib/x86_64-linux-gnu/libssl.so.3 \
    --library root/usr/lib/x86_64-linux-gnu/libcrypto.so.3 \
    --output ${out}/bin/openvpn-yandex --check

for package in openvpn libcap-ng0 liblzo2-2 liblz4-1 libpkcs11-helper1 libssl3; do
    cp root/usr/share/doc/${package}/copyright ${out}/share/licenses/openvpn-yandex/${package}
done
{% endblock %}
