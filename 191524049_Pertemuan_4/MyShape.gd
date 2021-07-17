extends Stroke

class_name MyShape

#Override
func randomTitik():
	var titik = [rand_range(50,970), rand_range(50,540)]
	return titik

func persegi(x, y, s, px, c):
	garisPutus(x, y, x+s, y, px, 1, c)
	garisPutus(x+s, y, x+s, y+s, px, 1, c)
	garisPutus(x+s, y+s, x, y+s, px, 1, c)
	garisPutus(x, y+s+1, x, y+1, px, 1, c)

func persegiPanjang(x, y, p, l, px, c):
	garisPutus(x, y, x+p, y, px, 1, c)
	garisPutus(x+p, y, x+p, y+l, px, 1, c)
	garisPutus(x+p, y+l, x, y+l, px, 1, c)
	garisPutus(x, y+l+1, x, y+1, px, 1, c)

func segitigaSiku(x, y, a, t, px, c):
	garisPutus(x, y, x+a, y, px, 1, c)
	garisPutus(x+a, y, x, y-t, px, 1, c)
	garisPutus(x, y-t, x, y, px, 1, c)

func trapesiumSiku(x, y, sa, sb, t, px, c):
	garisPutus(x, y, x+sa, y, px, 1, c)
	garisPutus(x+sa, y, x+sb, y+t, px, 1, c)
	garisPutus(x+sb, y+t, x, y+t, px, 1, c)
	garisPutus(x, y+t, x, y, px, 1, c)

func jajarGenjang(x, y, p, t, px, c):
	garisPutus(x, y, x+p, y, px, 1, c)
	garisPutus(x+p, y, x+p+30, y+t, px, 1, c)
	garisPutus(x+p+30, y+t, x+30, y+t, px, 1, c)
	garisPutus(x+30, y+t, x, y, px, 1, c)

func belahKetupat(x, y, d, px, c):
	garisPutus(x, y, x+(d/2), y+(d/2), px, 1, c)
	garisPutus(x+(d/2), y+(d/2), x, y+d, px, 1, c)
	garisPutus(x, y+d, x-(d/2), y+(d/2), px, 1, c)
	garisPutus(x-(d/2), y+(d/2), x, y, px, 1, c)
