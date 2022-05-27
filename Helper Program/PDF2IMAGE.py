# Jione Ban, 2032228
# R. Vincent , instructor
# Advanced Programming , section 1 
# Final Project

from pdf2image import convert_from_path  #convert pdf to img


#ls_of_pdf = ['PDFTOJSON/l1-2.pdf', "PDFTOJSON/l2.pdf", 'PDFTOJSON/l3.pdf', "PDFTOJSON/l4.pdf", "PDFTOJSON/l5.pdf", "PDFTOJSON/l6.pdf", "PDFTOJSON/l7.pdf", "PDFTOJSON/l8.pdf", "PDFTOJSON/l9.pdf", "PDFTOJSON/l10.pdf", "PDFTOJSON/l11.pdf"]

def pdf2image(ls_of_pdf):
    number = 1 
    for pdf in ls_of_pdf:             #for each lecture
        images = convert_from_path(pdf, fmt = "jpeg", output_folder = None)     
        for i in range(1,len(images) + 1):         #start from slide 1 to end
            images[i - 1].save(f"l{number}-{i:02}.jpg")         #rename images to proper title in format l1-01.jpg
        number += 1 

