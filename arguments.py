
import argparse

class Arguments:

    def __init__(self):
        self._args = self._parse_args()

    def _parse_args(self):

        example = '''Example use
        ./pdfgen --dir SOURCE_DIRECTORY
        ./pdfgen --dir SOURCE_DIRECTORY --ext FILENAME_EXTENSION'''
        

        parser = argparse.ArgumentParser(
                        prog='pdfgen',
                        description='Create a pdf containing a series of photos',
                        epilog=example,
                        formatter_class=argparse.RawDescriptionHelpFormatter)
        parser.add_argument('--dir', 
                            nargs='?', 
                            type=str,
                            default='.',
                            help='The folder containing the files')
        parser.add_argument('--ext', 
                            nargs='?', 
                            type=str, 
                            default='png',
                            help='The extension for the files')
        return parser.parse_args()

    def get_folder(self):
        return self._args.dir
    
    def get_extension(self):
        return self._args.ext