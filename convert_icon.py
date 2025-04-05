from PIL import Image
import os

def create_icon():
    # Create icons directory if it doesn't exist
    if not os.path.exists('icons'):
        os.makedirs('icons')
    
    # Open the image
    img = Image.open('icon.png')
    
    # Convert to RGBA if not already
    if img.mode != 'RGBA':
        img = img.convert('RGBA')
    
    # Create different sizes for the icon
    sizes = [(16,16), (32,32), (48,48), (64,64), (128,128), (256,256)]
    icons = []
    
    for size in sizes:
        resized_img = img.resize(size, Image.Resampling.LANCZOS)
        icons.append(resized_img)
    
    # Save as ICO
    icons[0].save('icons/app.ico', format='ICO', sizes=[(i.width, i.height) for i in icons], append_images=icons[1:])

if __name__ == '__main__':
    create_icon() 