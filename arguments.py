
import argparse

class Arguments:

    def __init__(self):
        self._args = self._parse_args()

    def _parse_args(self):
        parser = argparse.ArgumentParser(
                        description='Create a pdf containg a series of photos')
        parser.add_argument('folder', 
                            nargs='?', 
                            type=str, 
                            help='The folder containing the files')
        return parser.parse_args()

    def get_folder(self):
        return self._args.folder