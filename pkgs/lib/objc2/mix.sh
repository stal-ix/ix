{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/gnustep/libobjc2/archive/bdf03cb55da14943c8add1c45db7b5a93b656d59.zip
0188c7e35737d9dbe1aefb22d024e7c2
https://github.com/Tessil/robin-map/archive/refs/tags/v0.6.3.tar.gz
e6a362bff8372bbb4d901d2e28993a8a
{% endblock %}

{% block unpack %}
${unzip} ${src}/*.zip && cd lib*
rm -rf third_party/robin-map
${untar} ${src}/*.gz && mv robin* third_party/robin-map
{% endblock %}

{% block cmflags %}
-DTESTS=OFF
{% endblock %}

{% block patch %}
sed -e 's| SHARED | STATIC |g' -i CMakeLists.txt
#cat CMakeLists.txt | grep -v 'fobjc-runtime' > _ && mv _ CMakeLists.txt
{% endblock %}
