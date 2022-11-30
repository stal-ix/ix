{% extends 't/ix.sh' %}

{% block configure_flags %}
{{super()}}
--enable-ld-version-script=no
--disable-ld-version-script
--without-ld-version-script
{% endblock %}

{% block env %}
export COFLAGS="--with-libidn2=${out} \${COFLAGS}"
{% endblock %}

{% block install %}
{{super()}}
llvm-objcopy \
    --strip-symbol=_idn2_punycode_encode@IDN2_0.0.0 \
    --strip-symbol=_idn2_punycode_decode@IDN2_0.0.0 \
    ${out}/lib/libidn2.a
{% endblock %}

{% block test %}
if (llvm-nm ${out}/lib/libidn2.a | grep @); then
    echo 'have versioned symbols'
    exit 1
fi
{% endblock %}
