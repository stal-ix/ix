{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://chromium.googlesource.com/external/gyp/+archive/d6c5dd51dc3a60bf4ff32a5256713690a1a10376.tar.gz
sem:0349b69066c9347825a0d21ec315820e08c73d6d36622aade089ed189d4496a6
{% endblock %}

{% block bld_tool %}
bld/python/2
{% endblock %}

{% block install %}
cd ${out}; mkdir bin; cd bin; extract0 ${src}/*gz
sed -e 's|python|python2|' -i gyp
{% endblock %}

{% block test %}
${out}/bin/gyp --help
{% endblock %}
