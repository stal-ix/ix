{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
# url https://github.com/elfmz/far2l/archive/b246b95118c0d7c6d10b4e94ec9b3bc7e24c3a7c.zip
# md5 8fb228fd04476f5143163b9cca27366e
{% endblock %}

{% block bld_deps %}
lib/ssh/mix.sh
lib/pcre/mix.sh
lib/spdlog/mix.sh
lib/archive/mix.sh
lib/xerces-c/mix.sh
lib/magic/mix.sh
lib/uchardet/mix.sh
lib/fmt/mix.sh
{{'lib/linux/mix.sh' | linux}}
dev/build/pkg-config/mix.sh
dev/build/cmake/mix.sh
dev/lang/m4/mix.sh
env/std/mix.sh
{% endblock %}

{% block patch %}
find . | grep CMakeLists.txt | while read l; do
    sed -e 's/ MODULE / STATIC /' -i ${l}
done

{% if mix.platform.target.os == 'linux' %}
cat << EOF > execinfo.h
int backtrace(void**, int) {
    return 0;
}

void backtrace_symbols_fd(void* const*, int, int) {
}
EOF
{% endif %}
{% endblock %}

{% block cflags %}
export CPPFLAGS="-I${PWD} ${CPPFLAGS}"
export CPPFLAGS="-DPpmd8_RangeDec_Init=Ppmd8_RangeDec_InitXX -DPpmd8_Init=Ppmd8_InitXX -DPpmd8_Construct=Ppmd8_ConstructXX -DPpmd8_MakeEscFreq=Ppmd8_MakeEscFreqXX -DPpmd8_UpdateBin=Ppmd8_UpdateBinXX -DPpmd8_DecodeSymbol=Ppmd8_DecodeSymbolXX -DPPMD8_kExpEscape=PPMD8_kExpEscapeXX -DPpmd8_Free=Ppmd8_FreeXX -DPpmd8_Alloc=Ppmd8_AllocXX -DPpmd8_Update2=Ppmd8_Update2XX -DPpmd8_Update1=Ppmd8_Update1XX -DPpmd8_Update1_0=Ppmd8_Update1_0XX ${CPPFLAGS}"
{% endblock %}

{% block cmflags %}
-DUSEWX=no
{% endblock %}
