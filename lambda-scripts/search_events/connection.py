import os
from elasticsearch import Elasticsearch
import env_configuration as configuration


def get_es_connection():
    try:
        env = os.environ['environment']
    except KeyError:
        raise KeyError('Environment not selected')

    if env == 'dev':
        config = configuration.Development
    elif env == 'tst':
        config = configuration.Test
    elif env == 'prd':
        config = configuration.Production
    else:
        raise ValueError('Invalid environment')

    es = Elasticsearch(
        hosts=[{
            'host': config.ES_HOST,
            'port': config.ES_PORT
        }],
        timeout=config.ES_TIMEOUT
    )
    return es
