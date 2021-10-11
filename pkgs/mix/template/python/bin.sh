{% extends 'freeze.sh' %}

{% block more_deps %}
# bld dev/lang/python/libs
# bld dev/build/make tool/compress/upx env/std
{% endblock %}

{% block build %}
python3 $(dirname $(which python3))/freeze/freeze.py -m {{self.entry_point()}} $(cat modules)
make CC=clang -j ${make_thrs}
strip {{self.bin()}}
upx {{self.bin()}}
{% endblock %}

{% block install %}
mkdir -p ${out}/bin && cp {{self.bin()}} ${out}/bin/
{% endblock %}
