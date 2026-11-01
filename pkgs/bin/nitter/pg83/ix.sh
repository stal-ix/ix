{% extends '//die/nim/build.sh' %}

{% block pkg_name %}nitter{% endblock %}
{% block version %}
1
{% endblock %}

{% block nim_url %}
https://github.com/pg83/nitter/archive/refs/tags/1.tar.gz
{% endblock %}

{% block nim_src_sha %}
f0f4679a412b2afa8bb627e41d61ee61dd91b70eba097884fc5a5a3b3b6d5ff3
{% endblock %}

{% block nim_sha %}
35c134f61fa5e47c1e571998d9477a83cddb1c1d2dc6e094bf7241db80e4dd72
{% endblock %}

{% block bld_libs %}
lib/c
lib/openssl
lib/pcre
{% endblock %}

{% block host_libs %}
lib/c
lib/c++
lib/sass
lib/pcre
{% endblock %}

{% block nim_bin %}nitter{% endblock %}
{% block nim_main %}src/nitter.nim{% endblock %}

{% block patch %}
base64 -d << EOF | patch -p1
{% include 'version.patch/base64' %}
EOF
{% endblock %}

{% block nim_flags %}
{{super()}}
--mm:refc
--dynlibOverrideAll
-d:useOpenssl3
--passL:-lpcre
--passL:-lssl
--passL:-lcrypto
{% endblock %}

{% block build %}
{{super()}}
nimhost --dynlibOverrideAll --passL:-lsass --out:${tmp}/gencss tools/gencss.nim
${tmp}/gencss
nimhost --dynlibOverrideAll --passL:-lpcre \
    --out:${tmp}/rendermd tools/rendermd.nim
${tmp}/rendermd
{% endblock %}

{% block install %}
{{super()}}
mkdir -p ${out}/share/nitter
cp -R public ${out}/share/nitter/
sed 's|staticDir = "./public"|staticDir = "'${out}'/share/nitter/public"|' \
    nitter.example.conf > ${out}/share/nitter/nitter.conf.example
{% endblock %}
