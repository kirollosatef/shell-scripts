import os
from PIL import Image
from reportlab.lib.pagesizes import letter
from reportlab.platypus import SimpleDocTemplate, Image as RLImage, PageBreak, Paragraph
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.platypus import Spacer

# Define the input folder containing images and the output PDF file name
input_folder = "project"
output_pdf = "all.pdf"

# Ensure the output folder exists
if not os.path.exists(input_folder):
    print(f"The folder '{input_folder}' does not exist.")
    exit()

# Get a list of image files in the input folder
image_files = [f for f in os.listdir(input_folder) if f.lower().endswith(('.png', '.jpg', '.jpeg', '.gif'))]

if not image_files:
    print(f"No image files found in '{input_folder}'.")
    exit()

# Create a PDF document
doc = SimpleDocTemplate(output_pdf, pagesize=letter)

# Create a list to store the content of the PDF
pdf_content = []

# Define a style for the image names
styles = getSampleStyleSheet()
name_style = styles["Normal"]

# Iterate through each image and add it to the PDF
for image_file in image_files:
    # Get the image path
    image_path = os.path.join(input_folder, image_file)
    
    # Open the image using Pillow
    img = Image.open(image_path)
    
    # Resize the image to fit within the page size
    img.thumbnail((letter[0], letter[1]))
    
    # Create a Paragraph with the image name
    image_name = Paragraph(image_file, name_style)
    
    # Add the image name to the PDF
    pdf_content.append(image_name)
    
    # Add some space below the image name
    pdf_content.append(Spacer(1, 12))

    # Create an Image element in the PDF
    pdf_content.append(RLImage(image_path, width=img.width, height=img.height))

    # Add a page break to separate images
    pdf_content.append(PageBreak())

# Build the PDF
doc.build(pdf_content)

print(f"PDF created: {output_pdf}")
