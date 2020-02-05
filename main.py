
from arguments import Arguments
import os
import glob

from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Image
from reportlab.lib.units import inch


def make_doc(name):
    '''
    create a new document
    '''
    doc = SimpleDocTemplate(f'{name}.pdf',
                            pagesize=letter,
                            rightMargin=72,
                            leftMargin=72,
                            topMargin=18,
                            bottomMargin=18)
    return doc

def add_image(image, story):
    '''
    add an image with filename to the story
    '''
    # put image in upper left
    im = Image(image, 6*inch, 5*inch)
    story.append(im)
    

def grab_images(folder, extension):
    '''
    gets all the images from the folder and stores them in a list
    '''
    images = [f for f in glob.glob(f'{folder}/*.{extension}')]
    images.sort()
    return images


def main():

    # parse the args
    args = Arguments()
    folder = args.get_folder()

    images = grab_images(folder, 'png')

    story = []
    for image in images:
        add_image(image, story)
    

    name = os.path.basename(folder)
    doc = make_doc(name)
    doc.build(story)
    


if __name__ == "__main__":
    main()