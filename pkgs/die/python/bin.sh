{% extends 'freeze.sh' %}

{% block std_env %}
# TODO(pg): inherit conf values into bin
lib/python/3/10
bld/make
bld/pack
{{super()}}
{% endblock %}

{% set bin_out %}{{self.entry_point()}}.bin{% endset %}

{% block build %}
export PYTHONHOME=${TARGET_PYTHONHOME}
export PYTHONPLATLIBDIR=${PYTHONHOME}/lib
python3 $(dirname $(which python3))/../share/freeze/freeze.py -m {{self.entry_point()}} $(cat modules)
make -j ${make_thrs}
packexe {{bin_out}}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp {{bin_out}} ${out}/bin/{{self.entry_point()}}
{% endblock %}
