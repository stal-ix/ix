{% extends 'freeze.sh' %}

{% block std_env %}
# TODO(pg): inherit conf values into bin
lib/python/3/10
bin/make
bin/upx
{{super()}}
{% endblock %}

{% set bin_out %}{{self.entry_point()}}.bin{% endset %}

{% block build %}
export PYTHONHOME=${TARGET_PYTHONHOME}
export PYTHONPLATLIBDIR=${PYTHONHOME}/lib

python3 $(dirname $(which python3))/../share/freeze/freeze.py -m {{self.entry_point()}} $(cat modules)

make -j ${make_thrs}

{% if linux %}
strip {{bin_out}}
upx {{bin_out}}
{% endif %}
{% endblock %}

{% block install %}
mkdir -p ${out}/bin && cp {{bin_out}} ${out}/bin/{{self.entry_point()}}
{% endblock %}
