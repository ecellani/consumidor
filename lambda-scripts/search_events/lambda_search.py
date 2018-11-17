from __future__ import print_function
from bson import json_util
import json
import connection


def search_events(cpf):
    try:
        es = connection.get_es_connection()
    except Exception as e:
        raise e

    try:
        res = es.search(index='challenge',
                        body={
                            'query': {
                                'match': {
                                    'cpf': cpf
                                }
                            }
                        },
                        filter_path=['hits.hits._source'])

        return json.dumps(res, default=json_util.default)

    except Exception as e:
        raise e


def handler(event, context):
    try:
        search_events(event['queryStringParameters']['cpf'])
    except Exception as e:
        raise e


# if __name__ == '__main__':
#     import os
#     os.environ['environment'] = 'tst'
#     print(search_events('953.554.050-53'))
