{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
shadowsocks-libev
{% endblock %}

{% block version %}
3.3.6
{% endblock %}

{% block fetch %}
https://github.com/shadowsocks/shadowsocks-libev/releases/download/v{{self.version().strip()}}/shadowsocks-libev-{{self.version().strip()}}.tar.gz
ee83b43b36d6a51cfbee72254b6088d4b625feadf06cc2f0bcb810c8236438a5
https://github.com/shadowsocks/libcork/archive/074e074b26e9e372e90e6ade215217763c8644aa.tar.gz
f8e4b637f35bbe0bc5d893164e439aefa61d2b6fe58b0a79c30e42f5f54f08e0
https://github.com/shadowsocks/ipset/archive/3ea7fe30adf4b39b27d932e5a70a2ddce4adb508.tar.gz
89be31c635814948c0887f660d2a98f4bc4b1dc6691a57d653c2466a8098f887
https://github.com/shadowsocks/libbloom/archive/437e1add5a2b9a87797d8c648df7cf5f3ee155a8.tar.gz
6e0131faa238c5dd15da4b43931d2f628590ba07e1177a47ead8e4dd18752459
{% endblock %}

{% block unpack %}
mkdir src
cd src
extract1 ${src}/shadowsocks-libev-{{self.version().strip()}}.tar.gz
(cd libcork; extract1 ${src}/*074e074b26e9e372e90e6ade215217763c8644aa*)
(cd libipset; extract1 ${src}/*3ea7fe30adf4b39b27d932e5a70a2ddce4adb508*)
(cd libbloom; extract1 ${src}/*437e1add5a2b9a87797d8c648df7cf5f3ee155a8*)
{% endblock %}

{% block bld_libs %}
lib/c
lib/ev
lib/pcre/2
lib/kernel
lib/c/ares
lib/sodium
lib/mbedtls/2
{% endblock %}

{% block cmake_flags %}
WITH_STATIC=OFF
WITH_DOC_MAN=OFF
WITH_DOC_HTML=OFF
{% endblock %}
