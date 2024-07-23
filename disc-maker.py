from PIL import Image, ImageDraw

def create_blue_disc(filename='blue_disc.png', size=100, disc_color=(0, 0, 255), background_color=(0, 0, 0)):
    # Create an image with the given size and background color
    image = Image.new('RGB', (size, size), background_color)
    
    # Create a drawing context
    draw = ImageDraw.Draw(image)
    
    # Calculate the radius and the bounding box for the disc
    radius = size // 2
    bounding_box = [0, 0, size, size]
    
    # Draw the blue disc (circle)
    draw.ellipse(bounding_box, fill=disc_color)
    
    # Save the image as a PNG file
    image.save(filename)

# Create the blue disc image
create_blue_disc('blue_disc.png', size=100)
