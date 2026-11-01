{% extends '//die/env.sh' %}

{# x86-64-v3: AVX2, BMI1/2, FMA, F16C, LZCNT, MOVBE. CTRFLAGS precedes
   package flags in the cc wrapper, so per-file -march options can override
   this default baseline. #}
{% block env %}
export CTRFLAGS="-march=x86-64-v3 ${CTRFLAGS}"
{% endblock %}
