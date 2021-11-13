{% extends 'freeze.sh' %}

{% block more_deps %}
# bld lib/python/libs/mix.sh
# bld dev/build/make/mix.sh
# bld tool/compress/upx/mix.sh
# bld env/std/mix.sh
{% endblock %}

{% block build %}
python3 $(dirname $(command -v python3))/freeze/freeze.py -m {{self.entry_point()}} $(cat modules)
make CC=clang -j ${make_thrs}
#strip {{self.bin()}}
#upx {{self.bin()}}
{% endblock %}

{% block install %}
mkdir -p ${out}/bin && cp {{self.bin()}} ${out}/bin/
{% endblock %}
