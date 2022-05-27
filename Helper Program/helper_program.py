from PDF2IMAGE import pdf2image
from pdftojson import pdftojason

ls_of_pdf = []
print("ADD PDF FILES LECTURES IN ORDER FROM FIRST TO LAST")
while True:
    pdfnames = input("Input pdf path or enter n if you're done or b to delete the previous entry: ")             #ask for pdf directory 
    if pdfnames == "n":
        break
    elif pdfnames.split(".")[-1] == "pdf":                                        
        try:                                                                 #error check if pdf is valid
            f = open(pdfnames)                                               
            ls_of_pdf.append(pdfnames)                              
        except:
            print("Invalid entry")
    elif pdfnames == "b":
        entry = ls_of_pdf.pop()
        print(f"Successfully deleted last entry: {entry}")
    else:
        print("Invalid entry")
if len(ls_of_pdf) == 0:
    exit()

pdftojason(ls_of_pdf)
pdf2image(ls_of_pdf)
