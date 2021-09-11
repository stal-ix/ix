def package(mix):
    return {
        'runtime': {
            'depends': [
                'lib/c',
                'lib/compiler_rt',
                'env/c/nort',
            ],
        },
    }
