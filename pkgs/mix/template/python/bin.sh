{% extends 'freeze.sh' %}

{% block more_deps %}
# bld dev/lang/python/libs/package.sh
# bld dev/build/make/package.sh
# bld tool/compress/upx/package.sh
# bld env/std/package.sh
{% endblock %}

{% block build %}
python3 $(dirname $(command -v python3))/freeze/freeze.py -m {{self.entry_point()}} $(cat modules)
make CC=clang -j ${make_thrs}
strip {{self.bin()}}
upx {{self.bin()}}
{% endblock %}

{% block install %}
mkdir -p ${out}/bin && cp {{self.bin()}} ${out}/bin/
{% endblock %}
