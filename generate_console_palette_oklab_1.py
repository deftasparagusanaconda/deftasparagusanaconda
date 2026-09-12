import lcms2, oklab, math

#theta = math.radians(45)
#lightness = 0/3 + 2/3 * math.sin(theta)
#chroma = 2/3 * math.cos(theta)

lightness = 3/4
chroma = 0.11625
#chroma = 0.1275

transformer = lcms2.Transform(
	lcms2.Profile("sRGB"), 
	"RGB_DBL", 
	lcms2.Profile(filename='/home/daa/mine 2.2.icc'), 
	"RGB_DBL")
colors = [oklab.rgb_to_hex(transformer.apply(color)) for color in [
#colors = [oklab.rgb_to_hex(color) for color in [
	oklab.lch_to_rgb((0/4, 0, 0)),
	oklab.lch_to_rgb((lightness, chroma,  30)),
	oklab.lch_to_rgb((lightness, chroma, 150)),
	oklab.lch_to_rgb((lightness, chroma,  90)),
	oklab.lch_to_rgb((lightness, chroma, 270)),
	oklab.lch_to_rgb((lightness, chroma, 330)),
	oklab.lch_to_rgb((lightness, chroma, 210)),
	oklab.lch_to_rgb((3/4, 0, 0)),
	oklab.lch_to_rgb((2/4, 0, 0)),
	oklab.lch_to_rgb((lightness, chroma,  30)),
	oklab.lch_to_rgb((lightness, chroma, 150)),
	oklab.lch_to_rgb((lightness, chroma,  90)),
	oklab.lch_to_rgb((lightness, chroma, 270)),
	oklab.lch_to_rgb((lightness, chroma, 330)),
	oklab.lch_to_rgb((lightness, chroma, 210)),
	oklab.lch_to_rgb((4/4, 0, 0))]]

print('\n'.join(colors))
