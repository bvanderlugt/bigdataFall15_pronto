import requests
import json
import time
import sys
import os
import datetime
from optparse import OptionParser


def read_options():
    parser = OptionParser()
    parser.add_option("-i", "--interval", dest="interval",
                      help="Request data every i minutes. Default=5 (5 mins)",
                      default="5", type="int")
    parser.add_option("-f", "--file_name", dest="output_file_name",
                      help="Specify an output file. Default = 'pronto_data.json'",
                      default="pronto_data.json", type="string")
    parser.add_option("-l", "--file_location", dest="output_file_dir",
                      help="Specify a directory path for output",
                      default="/var/log", type="string")
    (options, args) = parser.parse_args()
    return options


def remove_old_file(file_name):
    '''removes existing json file if present'''
    try:
        os.remove(file_name)
        print('\ncleaning up old output file')
    except OSError:
        print('\ncreating new output file: {0}'.format(file_name))


def request_data():
    '''send get request to pronto data source'''
    response = requests.get('https://secure.prontocycleshare.com/data/stations.json',
                            timeout=5)
    data = response.json()
    return data


def main():
    '''creates a log-like file from GET calls to pronto api'''
    options = read_options()
    output_file = os.path.join(options.output_file_dir, options.output_file_name)
    remove_old_file(output_file)
    try:
        print('\nBegin requesting data. Enter "^C" to stop')
        while True:
            data = request_data()
            with open(output_file, 'ab+') as outfile:
                json.dump(data, outfile)
                outfile.write('\n')
                print('\n Data written at %s' % datetime.datetime.utcnow())
            time.sleep(options.interval * 60)
    except KeyboardInterrupt:
        print('\nData request stopped')
        sys.exit(0)

if __name__ == '__main__':
    main()
