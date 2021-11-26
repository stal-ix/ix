{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/rui314/mold/archive/72cea9a0bfcdee7cb17cc34bed9aacdea2f80adf.zip
3dae5052de710eff4818dc4f83e2c106
{% endblock %}

{% block bld_libs %}
lib/z/mix.sh
lib/xxhash/mix.sh
lib/intel/tbb/mix.sh
lib/openssl/mix.sh
{% endblock %}

{% block bld_tool %}
tool/compress/minigzip/mix.sh
{% endblock %}

{% block make_flags %}
SYSTEM_MIMALLOC=1
SYSTEM_TBB=1
{% endblock %}

{% block make_target %}
mold
{% endblock %}
