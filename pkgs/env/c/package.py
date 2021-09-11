def package(mix):
    return {
        'runtime': {
            'depends': [
                'env/c/nort',
{% if mix.platform.target.os == 'linux' %}
                'lib/musl/full',
{% endif %}
                'lib/compiler_rt',
            ],
        },
    }
