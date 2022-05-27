# Jione Ban, 2032228
# R. Vincent , instructor
# Advanced Programming , section 1 
# Final Project


import json
import PyPDF2       #used to read the pdf
def pdftojason(ls_of_pdf):
    def format_title(title):                   #format title
        return title.split('-')[1].strip()          


    with open('data_format.json') as f:                         
        data = json.load(f)                    #load json file into dict

    id_num = 0                                #id num of each lecture

    for pdf in ls_of_pdf:                     #for each lecture
        pdf_file = open(pdf, 'rb')
        read_pdf = PyPDF2.PdfFileReader(pdf_file)     
        info = read_pdf.getDocumentInfo()         
        title = info.title                    #get title name
        title = format_title(title) 
        totalpages = str(read_pdf.numPages)   #total pages
        
        
        while True:                           #ask user for link for each lecture
            ask = input(f"Do you want to input video for {title} y/n: ")
            if ask == 'y':
                video = input("link: ")

                break
            elif ask == 'n':
                video = None
                break
        
        try:
            data["content"]["lessons"][id_num] = {'id':id_num, 'title':title, "video":video , 'pages': totalpages}          #update each lecture
        except:
            data["content"]["lessons"].append({'id':id_num, 'title':title, "video":video , 'pages': totalpages})            #if past the list of original lectures append more lectures to list
        id_num += 1


    with open("data.json", "w") as f:
        json.dump(data, f)                    #dump dict into json file 

