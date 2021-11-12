module Primitives
  module Elementary
     def distance_points(p1, p2)
		Math.sqrt((p2.x - p1.x)*(p2.x - p1.x) + (p2.y - p1.y)*(p2.y - p1.y))
    end
	def rectangle_area(p1, p2)
		a = (p2.x - p1.x)*(p2.y - p1.y)
		if a<0
			a = -a
		end
		a
	end
	def rectangle_triangle(p1, p2,p3)
		a = distance_points(p1, p2)
		b = distance_points(p3, p2)
		c = distance_points(p1, p3)
		p = (a+b+c)/2
		Math.sqrt(p*(p - a)*(p - b)*(p - c))
	end
	def one_line?(p1, p2,p3)
		((p3.x - p1.x) / (p2.x - p1.x) == (p3.y - p1.y) / (p2.y - p1.y)) 
	end
	def intersect_straight_lines_by_points(p1, p2,p3,p4)
		x = ((p1.x*p2.y - p1.y*p2.x)*(p3.x-p4.x)-(p1.x-p2.x)*(p3.x*p4.y-p3.y*p4.x))/((p1.x-p2.x)*(p3.y-p4.y)-(p1.y-p2.y)*(p3.x-p4.x))
		y = ((p1.x*p2.y - p1.y*p2.x)*(p3.y-p4.y)-(p1.y-p2.y)*(p3.x*p4.y-p3.y*p4.x))/((p1.x-p2.x)*(p3.y-p4.y)-(p1.y-p2.y)*(p3.x-p4.x))
		p=Point.new(x, y)
		p
    end
	def lines_are_parallel_by_points?(p1, p2,p3,p4)
		(p1.x-p2.x)*(p3.y-p4.y)==(p1.y-p2.y)*(p3.x-p4.x)
	end
	def angle_straight_lines_by_points(p1, p2,p3,p4)
		k1 = (p2.x-p1.x)/(p2.y-p1.y)
		k2 = (p4.x-p3.x)/(p4.y-p3.y)
		tg = (k2-k1)/(1+k1*k2)
		a=Math.atan(tg)*180/Math::PI
		if a<0
			a = -a
		end
		a
	end
	def lines_are_perpendicular_by_points?(p1, p2,p3,p4)
		angle_straight_lines_by_points(p1, p2,p3,p4)==90
	end
    def intersect_straight_lines(straight_line1, straight_line2)
		a1 = straight_line1.a
		b1 = straight_line1.b
		c1 = straight_line1.c
		a2 = straight_line2.a
		b2 = straight_line2.b
		c2 = straight_line2.c
		y = (a1*c2-a2*c1)/(a2*b1-a1*b2)
		x = -(c1+b1*y)/a1
		point = Point.new(x, y)
		point
    end
	def angle_straight_lines(straight_line1, straight_line2)
		a1 = straight_line1.a
		b1 = straight_line1.b
		a2 = straight_line2.a
		b2 = straight_line2.b
		tg = (a1*b2-a2*b1)/(a1*a2+b1*b2)
		a=Math.atan(tg)*180/Math::PI
		if a<0
			a = -a
		end
		a
	end
	def lines_are_perpendicular?(straight_line1, straight_line2)
		angle_straight_lines(straight_line1,straight_line2)==90
	end
	def lines_are_parallel?(straight_line1, straight_line2)
		a1 = straight_line1.a
		b1 = straight_line1.b
		a2 = straight_line2.a
		b2 = straight_line2.b
		a1*b2-a2*b1==0
	end
	def one_straightline?(straight_line1,p)
		a = straight_line1.a
		b = straight_line1.b
		c = straight_line1.c
		a*p.x+b*p.y+c==0
	end
	def distances_between_parallel_lines(straight_line1, straight_line2)
		a1 = straight_line1.a
		b = straight_line1.b/a1
		c1 = straight_line1.c/a1
		a2 = straight_line2.a
		c2 = straight_line2.c/a2
		d = (c2-c1)/Math.sqrt(1+b*b)
		if d<0
			d = -d
		end
		d
	end
  end
end

















