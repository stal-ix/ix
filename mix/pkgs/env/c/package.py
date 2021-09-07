def package(mix):
    return {
        'runtime': {
            'depends': [
                'env/c/nort',
                'lib/compiler_rt',
            ],
        },
    }
