#!/opt/homebrew/bin/python3

# import os
import sys
from PIL import Image, ImageFilter, ImageEnhance
import matplotlib.pyplot as plt


def blurred_border_resize(inner_image, target_aspect, blur_radius=200, brightness=0.8): 
    inner_width, inner_height = inner_image.size
    inner_aspect = inner_width/inner_height
    result = inner_image.copy()
    if inner_aspect > target_aspect:
        # Extend at top and bottom
        outer_width = inner_width
        outer_height = int(outer_width / target_aspect)
        inner_upper_left_coord = (0, int(outer_height/2 - inner_height/2))
    elif inner_aspect < target_aspect:
        # Extend at right and left
        outer_height = inner_height
        outer_width = int(outer_height * target_aspect)
        inner_upper_left_coord = (int(outer_width/2 - inner_width/2), 0)
    else:
        # Image is correct size, do nothing
        return inner_image
    result = result.resize((outer_width, outer_height))
    result = result.filter(ImageFilter.GaussianBlur(blur_radius))
    brightness_enhancer = ImageEnhance.Brightness(result)
    result = brightness_enhancer.enhance(brightness)
    result.paste(inner_image, box=inner_upper_left_coord)
    return result


def main():
    # Parse cmd args and apply blurred borders
    # TODO: add option for flags
    # print(f"CWD: {os.getcwd()}")
    target_width, target_height = sys.argv[1].split("/")
    target_aspect = float(target_width)/float(target_height)
    args = sys.argv[2:]
    for arg in args:
        try:
            image = Image.open(arg)
        except OSError:
            print(f"Warning: file {arg} not found. Skipping {arg}")
            break
        name, extension = arg.split(".")
        result = blurred_border_resize(image, target_aspect)

        result.save(f"{name}_blurred_border.{extension}", quality=100)


if __name__ == "__main__":
    main()
