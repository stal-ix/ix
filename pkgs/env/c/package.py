def package(mix):
    return {
        'runtime': {
            'depends': [
                'env/c/nort',
                'lib/compiler_rt',
{% if mix.platform.target.os == 'linux' %}
                'lib/musl',
{% endif %}
            ],
        },
    }
