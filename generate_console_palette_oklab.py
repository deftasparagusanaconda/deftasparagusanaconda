import lcms2, oklab, math

theta = math.radians(75.4)
lightness = 1/4 + 2/4 * math.sin(theta)
chroma = 2/4 * math.cos(theta)
icc = '/home/daa/mine 2.2.icc'
transformer = lcms2.Transform(lcms2.Profile("sRGB"), "RGB_DBL", lcms2.Profile(filename=icc), "RGB_DBL")

colors = [oklab.rgb_to_hex(transformer.apply(color)) for color in [
	oklab.lch_to_rgb((1/4, 0, 0)),
	oklab.lch_to_rgb((lightness, chroma,  30)),
	oklab.lch_to_rgb((lightness, chroma, 150)),
	oklab.lch_to_rgb((lightness, chroma,  90)),
	oklab.lch_to_rgb((lightness, chroma, 270)),
	oklab.lch_to_rgb((lightness, chroma, 330)),
	oklab.lch_to_rgb((lightness, chroma, 210)),
	oklab.lch_to_rgb((3/4, 0, 0)),
	oklab.lch_to_rgb((0/4, 0, 0)),
	oklab.lch_to_rgb((lightness, chroma,  30)),
	oklab.lch_to_rgb((lightness, chroma, 150)),
	oklab.lch_to_rgb((lightness, chroma,  90)),
	oklab.lch_to_rgb((lightness, chroma, 270)),
	oklab.lch_to_rgb((lightness, chroma, 330)),
	oklab.lch_to_rgb((lightness, chroma, 210)),
	oklab.lch_to_rgb((4/4, 0, 0))]]

print('\n'.join(colors))
