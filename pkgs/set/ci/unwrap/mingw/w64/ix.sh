{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/jq
bin/gg
bin/b64
bin/sed
bin/idn
bin/file
bin/yajl
bin/gzip
bin/nasm
bin/re2c(verbose=1,setx=1)
bin/gperf
bin/iconv
bin/idn/2
bin/protoc
bin/lld/16
bin/bsdtar
#bin/doxygen
bin/mawk/lite
bin/bison/3/8
{% endblock %}
