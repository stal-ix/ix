{% block setup_host_tc %}
(
    set -eu

    source_env "${MIX_H_DIR}"
    setup_tc host
)

export HOST_CC=${PWD}/host/cc
export HOST_CXX=${PWD}/host/c++
export HOST_AR=${PWD}/host/ar
export HOST_NM=${PWD}/host/nm
export HOST_RANLIB=${PWD}/host/ranlib
{% endblock %}

{% block setup_target_tc %}
source_env "${MIX_T_DIR}"

# yep, THE ONLY place for this shit
pushd ${bld}
{% block setup %}
{% endblock %}
popd

setup_tc target

export LDFLAGS=
export CFLAGS=
export CPPFLAGS=
export CXXFLAGS=
export CONLYFLAGS=

for x in cc gcc c99 clang; do
    ln -s target/cc ${x}
done

for x in c++ g++ clang++; do
    ln -s target/c++ ${x}
done

for x in cpp clang-cpp; do
    ln -s target/preproc ${x}
done

for x in ar nm ranlib; do
    ln -s target/${x} ${x}
done
{% endblock %}
